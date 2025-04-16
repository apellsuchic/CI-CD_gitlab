#!/bin/bash

scp -r build/s21_cat adm-dep@10.1.30.37:/usr/local/bin
if [[ $? -eq 1 ]]; then 
    exit 1
fi
scp -r build/s21_grep adm-dep@10.1.30.37:/usr/local/bin
if [[ $? -eq 1 ]]; then 
    exit 1
fi