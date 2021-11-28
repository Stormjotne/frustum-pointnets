#!/bin/bash
virtualenv venv --python=python3.7
# Use equivalent to the command below if python is not installed on system level
# virtualenv venv --python=$(which python3.7)

source venv/bin/activate
# Install dependencies
pip install -r requirements.txt