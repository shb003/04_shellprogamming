#!/bin/bash

Usage(){
    echo "Usage: $0 {-x} {-y}"
    exit 1
}

while getopts xy options 2>/dev/null
do
    case $options in
    x) echo "X nom" ;;
    y) echo "Y nom + $OPTARG";;
    *) Usage ;;
    esac
done

    
echo "$@"
shift $(expr $OPTIND - 1)  
echo "$@"