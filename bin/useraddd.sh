#!/bin/bash

file1=/root/bin/user.list
cat $file1 | while uname upass

do 
    userdel -r $uname
    echo "[ok] uname$"
done