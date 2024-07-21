```bash
name1="John"
name2="Mary"

# if and else statements
if [ "$name1" = "$name2" ]; then
    echo "The names are the same."
else
    echo "The names are different."
fi

#simple if - are names different?
if [ "$name1" != "$name2" ]; then
    echo "The names are different."
fi

num1=5
num2=10

# -eq: equals
if [ "$num1" -eq "$num2" ]; then
    echo "$num1 is equal to $num2"
fi  

# -ne: not equalts
if [ "$num1" -ne "$num2" ]; then
    echo "$num1 is not equal to $num2"
fi  

# -lt: less than
if [ "$num1" -lt "$num2" ]; then
    echo "$num1 is less than to $num2"
fi  

# -gt: greater than
if [ "$num1" -gt "$num2" ]; then
    echo "$num1 is greter than to $num2"
fi  

# -ge: greater than or equal to
if [ "$num1" -ge "$num2" ]; then
    echo "$num1 is greater than or equal to $num2"
fi  

# -e: file or directory exists?
if [  -e "file.txt" ]; then
    echo "The file exists."
fi

# -f: file exists?
if [ ! -f megasena-random.txt ]; then
    touch megasena-random.txt
fi

```