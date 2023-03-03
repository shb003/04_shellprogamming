#!/bin/bash

for NAME in `cat /etc/ftpd/ftpusers`
do
    echo "$NAME can't access to FTP SERVER"
done