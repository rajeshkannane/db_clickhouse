#!/usr/bin/env Rscript

cat("# snowflake-parse-log.R: starting to parse timings from snowflake/log/.\n")

source("./_helpers/helpers.R")
args = commandArgs(TRUE) # args = c("groupby","G1_1e6_1e2_0_0")
stopifnot(length(args)==2L)
task = args[1L]
data_name = args[2L]
library(data.table)
# sort files according to question and run
sort_q_r = function(f) {
  tmp = strsplit(tools::file_path_sans_ext(basename(f)), "_", fixed=TRUE)
  #print(tmp)
  if (length(len<-unique(lengths(tmp)))!=1L)
    stop("files names for some of logs differs in number of underscores, it should be snowflake/log/[task]_[data_name]_q[i]_r[j].csv")
  stopifnot(len>1L)
  qr = rbindlist(lapply(lapply(tmp, `[`, c(len-1L,len)), function(x) {
    stopifnot(substr(x[1L], 1L, 1L)=="q", substr(x[2L], 1L, 1L)=="r")
    list(q=as.integer(substr(x[1L], 2L, nchar(x[1L]))), r=as.integer(substr(x[2L], 2L, nchar(x[2L]))))
  }))
  o = data.table:::forderv(qr) ## https://github.com/Rdatatable/data.table/issues/3447
  if (!length(o)) f else f[o]
}
fcsv = list.files("snowflake/log", sprintf("^%s_%s_q.*\\.csv$", task, data_name), full.names=TRUE)
if (!length(fcsv))
  stop("no log files produced, did you run snowflake sql script that will output such to snowflake/log/[task]_[data_name]_q[i]_r[j].csv")
fcsv = sort_q_r(fcsv)
d = rbindlist(lapply(fcsv, fread, na.strings="\\\\N")) # fill=TRUE for debugging type column in some queries
if (!nrow(d))
  stop("timing log files empty")
stopifnot(all(d$task==task), all(d$data_name==data_name))

.in_rows = strsplit(data_name, "_", fixed=TRUE)[[1L]][[2L]] ## taken from data_name because for join CH will sum in rows from both tables

d[,
  write.log(run=as.integer(RUN), timestamp=as.numeric(TIMESTAMP), task=as.character(TASK), data=as.character(DATA_NAME), in_rows=as.numeric(.in_rows), question=as.character(QUESTION),
            out_rows=as.numeric(NA), out_cols=as.integer(NA), solution=as.character(SOLUTION), version=as.character(VERSION), git=as.character(NA), fun=as.character(FUN),
            time_sec=as.numeric(TIME_SEC), mem_gb=as.numeric(MEM_GB), cache=as.logical(CACHE), chk=as.character(NA), chk_time_sec=as.numeric(NA), on_disk=as.logical(ON_DISK)),
  by = seq_len(nrow(d))] -> nul

cat("# snowflake-parse-log.R: parsing timings to time.csv finished\n")

if (!interactive()) q("no")
