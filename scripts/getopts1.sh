#!/bin/bash

Usage(){
    echo "Usage: $0 {-x} {-y}"
    exit 1
}

while getopts xy options
do
    case $options in
    x) echo "X nom" ;;
    y) echo "Y nom" ;;
    *) Usage ;;
    esac
done