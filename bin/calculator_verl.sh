#!/bin/bash

echo "enter first num : "
read num1

echo "enter second num : "
read num2

echo "=============================================="
echo " (1). +    (2). -    (3). *    (4). /         "
echo "=============================================="

echo "enter choice num! : "
read C

case $C in
    1) echo "$num1 + $num2 = `expr $num1 + $num2` "  ;;
    2) echo "$num1 - $num2 = `expr $num1 - $num2` "  ;;
    3) echo "$num1 x $num2 = `expr $num1 \* $num2` " ;;
    4) echo "$num1 / $num2 = `expr $num1 / $num2` "  ;;
    *) echo " xxxxxx " exit 1 ;;
esac