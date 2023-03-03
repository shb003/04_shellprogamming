#!/bin/bash

. /root/bin/functions.sh

# Install the pkg
# 1. gcc
# 2. php
pkgInst "gcc php"
# 3. vscode
#vscodeInst
vscodeComment
# 4. chrome
chromeInst