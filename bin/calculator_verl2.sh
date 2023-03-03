#!/bin/bash

echo "enter first num : "
read num1

echo "enter choice operator : "
read op

echo "enter second num : "
read num2

if [ "$op" = "+" ] ; then
    echo "$num1 + $num2 = `expr $num1 + $num2`"
elif [ "$op" = "-" ] ; then
    echo "$num1 - $num2 = `expr $num1 - $num2` " 
elif [ "$op" = "*" ] ; then
    echo "$num1 x $num2 = `expr $num1 \* $num2` "
elif [ "$op" = "/" ] ; then
    echo "$num1 / $num2 = `expr $num1 / $num2` "
else
    echo "error!" exit 1;
fi 
