#!/bin/bash

scp -r src/build/s21_cat adm-dev@10.1.30.37:/usr/local/bin
if [[ ! $? -eq 0 ]]; then 
    exit 1
fi
scp -r src/build/s21_grep adm-dev@10.1.30.37:/usr/local/bin
if [[ ! $? -eq 0 ]]; then 
    exit 1
fi