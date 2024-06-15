#### Strings

Strings are a fundamental data type in Bash shell scripting, used to store and manipulate text. They are sequences of characters that can include letters, numbers, symbols, and spaces.

#### String Example
```
nixmin@DESKTOP:~$ my_string="Hello Bash!"
nixmin@DESKTOP:~$ echo my_string
my_string
```

#### String operations

1) String Basics
```
# Using double quotes
nixmin@DESKTOP:~$ my_string="Hello, World!"

# Using single quotes
nixmin@DESKTOP:~$ my_string='Hello, World!'

The difference is that double quotes allow for the interpretation of special characters and variables, while single quotes treat everything literally.
```

2) String Output
```
To output string

nixmin@DESKTOP:~$ echo $my_string  # Output: Hello, World!
```

3) Concatenating Strings
```
nixmin@DESKTOP:~$ str1="Hello, "
nixmin@DESKTOP:~$ str2="World!"
nixmin@DESKTOP:~$ full_string="$str1$str2"
nixmin@DESKTOP:~$ echo $full_string
nixmin@DESKTOP:~$ Hello, World!
```

4) String Length
```
nixmin@DESKTOP:~$ str="Hello"
nixmin@DESKTOP:~$ length=${#str}
nixmin@DESKTOP:~$ echo $length
nixmin@DESKTOP:~$ 5
```

5) SubStrings
```
nixmin@DESKTOP:~$ str="Hello, World!"
nixmin@DESKTOP:~$ echo ${string:7:5}  
nixmin@DESKTOP:~$ World
```

6) Replace
```
nixmin@DESKTOP:~$ str="Hello, World!"
nixmin@DESKTOP:~$ new_string=${string/World/Universe}
nixmin@DESKTOP:~$ echo $new_str
nixmin@DESKTOP:~$ Hello, Universe!
```



