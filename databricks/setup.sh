#!/bin/bash
set -e
cd ~
cd git/db-benchmark

virtualenv databricks/py-databricks --python=/usr/bin/python3
source databricks/py-databricks/bin/activate

pip install databricks-cli
pip install databricks-cli --upgrade
#pip install databricks-sql-cli
databricks --version
databricks configure --token
