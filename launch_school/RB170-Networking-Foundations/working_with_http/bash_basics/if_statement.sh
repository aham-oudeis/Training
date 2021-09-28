small_int=3
large_int=139

emp_str=""
str_hello="Hello!"
str_bye="Bye!"

if [[ -n $emp_str ]]
then
  echo "emp_str is a non-empty string."
else
  echo "emp_str is an empty string."
fi

if [[ -z $emp_str ]]
then
  echo "emp_str is an empty string verified by -z operator."
fi

if [[ $str_hello = $str_bye ]]
then
  echo "$str_hello is equal to $str_bye."
else
  echo "$str_hello is not equal to $str_bye."
fi

if [[ $small_int -lt 10 ]]
then
    echo "$small_int is smaller than 10."
fi

if [[ $small_int -lt 3 ]]
then
  echo "$small_int is less than 3."
else
  echo "$small_int is not less than 3."
fi

if [[ $small_int -lt 3 ]]
then
  echo "$small_int is less than 3."
elif [[ $small_int -le 3 ]]
then
  echo "$small_int is less than or equal to 3."
else
  echo "$small_int is greater than 3."
fi

if [[ -e ./hello_world.sh ]]
then
  echo "hello_world.sh file exists in the current directory."
else
  echo "hello_world.sh file does not exist in the current directory."
fi

if [[ -f ./hello_world ]]
then
  echo "hello_world file exists in the current directory and it is a regular file."
elif [[ -e ./hello_world ]]
then
  echo "hello_world file exits but is not a regular file."
else
  echo "hello_world file does not exist. It needs the correct file extension as well."
fi

if [[ -d ../bash_basics ]]
then
  echo "bash_basics exists and is a directory."
fi
