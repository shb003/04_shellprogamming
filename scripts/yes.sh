#!/bin/bash

echo "Enter Your Choice? (yes/no) :"
read Choice

case $Choice in
    yes | Y | Yes | YES | y) echo "Yes... Entered" ;;
    no  | N | No  | NO  | n) echo "No... Entered"  ;;
    *) echo "Answer not recongnize" 
       exit 1 ;;
esac