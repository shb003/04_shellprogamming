#!/bin/bash

echo "Enter Your Filename : "    
read FILENAME

if [ -x $FILENAME ] ; then         
    . $FILENAME
fi