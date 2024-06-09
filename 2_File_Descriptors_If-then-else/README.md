#### File Descriptors

Standard Input          0
Standard Output         1
Standard Error          2

#### Example of Standard input 
```
When a file exists

nixmin@DESKTOP:$ cat file1
Hello
nixmin@DESKTOP:$ cat >&1 file1
Hello
```

#### Example of standard error
```
When a file does not exists

nixmin@DESKTOP:~$ cat nofile
cat: nofile: No such file or directory
```

#### Redirection of standard errors
```
When a file does not exists

nixmin@DESKTOP:~$ cat nofile 2>/dev/null
nixmin@DESKTOP:~$
```

### Power Parse
```
Passing file as input to a command

nixmin@DESKTOP:~$ cat /etc/passwd > file3

nixmin@DESKTOP:~$ cat file3
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
```

#### Print errors and redirect to standard out
```
Get standard output and also redirect to a file

nixmin@DESKTOP:~$ cat /etc/passwd | tee file4
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
```

#### Comparison Operators
```
nixmin@DESKTOP:~$ if "1>2"
> then
> echo "1"
> else
> echo "2"
> fi
1>2: command not found
2

Using Comparison operators and also redirecting standard errors 

nixmin@DESKTOP:~$ if "1>2"; then echo "1"; else echo "2"; fi 2>/dev/null
2
```

#### Test command Examples

1) Test File Attributes

File exists
```
nixmin@DESKTOP:~$ test -e /etc/passwd && echo "YES" || echo "NO"
YES
```

If a file is regular file

```
nixmin@DESKTOP:~$ test -f /etc/passwd && echo "YES" || echo "NO"
YES
```

If a dir exists
```
nixmin@DESKTOP:~$ test -d /etct && echo "YES" || echo "NO"
NO
```

Check if a file is readable
```
nixmin@DESKTOP:~$ test -r /etc/passwd && echo "YES" || echo "NO"
YES
```

Check if a file is writable
```
nixmin@DESKTOP:~$ test -r /etc/passwd && echo "YES" || echo "NO"
NO
```

Check if a file is executable
```
nixmin@DESKTOP:~$ test -e /etc/passwd && echo "YES" || echo "NO"
YES
```

2) Test String Attributes

Check if a string is non-empty
```
nixmin@DESKTOP:~$ test -n "$string" && echo "String is non-empty" || echo "String is empty"
String is empty
```

Check if a string is empty
```
nixmin@DESKTOP:~$ test -n "$string" && echo "String is non-empty" || echo "String is empty"
String is empty
```

Check if two strings are equal
```
nixmin@DESKTOP:~$ test "$string1" = "$string2" && echo "Strings are equal" || echo "Strings are not equal"
```

Check if two strings are not equal
```
nixmin@DESKTOP:~$ test "$string1" != "$string2" && echo "Strings are not equal" || echo "Strings are equal"
```

3) Test Numeric Comparisons

Check if two numbers are equal
```
test "$num1" -eq "$num2" && echo "Numbers are equal" || echo "Numbers are not equal"
```

Check if one number is greater than another
```
test "$num1" -gt "$num2" && echo "$num1 is greater than $num2" || echo "$num1 is not greater than $num2"
```

Check if one number is less than another
```
test "$num1" -lt "$num2" && echo "$num1 is less than $num2" || echo "$num1 is not less than $num2"
```

Check if one number is greater than or equal to another
```
test "$num1" -ge "$num2" && echo "$num1 is greater than or equal to $num2" || echo "$num1 is not greater than or equal to $num2"
```

Check if one number is less than or equal to another:
```
test "$num1" -le "$num2" && echo "$num1 is less than or equal to $num2" || echo "$num1 is not less than or equal to $num2"
```

Check if two numbers are not equal:
```
test "$num1" -ne "$num2" && echo "Numbers are not equal" || echo "Numbers are equal"
```

4) Test Logical Operators

Logical AND (both conditions must be true)
```
test "$num1" -eq "$num2" -a "$string1" = "$string2" && echo "Both conditions are true" || echo "Both conditions are not true"
```

Logical OR (at least one condition must be true)
```
test "$num1" -eq "$num2" -o "$string1" = "$string2" && echo "At least one condition is true" || echo "Neither condition is true"
```

5) Combined Tests

Check if a file exists and is writable

```
test -e /path/to/file -a -w /path/to/file && echo "File exists and is writable" || echo "File does not exist or is not writable"
```

Check if a directory exists and a string is non-empty
```
test -d /path/to/directory -a -n "$string" && echo "Directory exists and string is non-empty" || echo "Directory does not exist or string is empty"
```

#### Example script to check if a file exists or not
```
#!/bin/bash
if [[ -e "/etc/passwd" ]];
then
        echo "passwd file exists"
else
        echo "File not found"
fi
```
Output

```
nixmin@DESKTOP:~$ ./file_check.sh
passwd file exists
```

#### Command line parameters 
```
#!/bin/bash
if [[ -z "$1" ]]; 
then
    echo "Please provide parameter"
else
    echo "Thanks"
```

Output

nixmin@DESKTOP:~$ ./parameter_check.sh TestParameter
Thanks
