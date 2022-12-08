#!/bin/bash
set -e

# install dependencies
sudo apt-get update -qq
sudo apt-get install -y python3 virtualenv

cd ~/git/db-benchmark
Rscript _data/groupby-datagen.R 1e7 1e2 0 0
Rscript _data/groupby-datagen.R 1e8 1e2 0 0

mkdir -p data
sudo mv G1_1e7_1e2_0_0.csv ~/git/db-benchmark/data
sudo mv G1_1e8_1e2_0_0.csv ~/git/db-benchmark/data

virtualenv polars/py-polars --python=python3.10
source polars/py-polars/bin/activate

python3 -m pip install --upgrade psutil polars
python3 -m pip install numpy

./_launcher/solution.R --solution=polars --task=groupby --nrow=1e
