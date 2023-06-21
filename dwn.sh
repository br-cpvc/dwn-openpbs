#!/usr/bin/env bash

# from: https://www.openpbs.org/Download.aspx#download
# redirected from https://github.com/openpbs/openpbs
zipfile="openpbs_22.05.11.ubuntu_20.04.zip"
if [[ ! -f $zipfile ]]; then
    wget https://vcdn.altair.com/rl/OpenPBS/$zipfile
fi
unzip $zipfile
