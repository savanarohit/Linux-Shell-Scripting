#### Flow Control in Linux Shell Scripting

Flow control in Linux shell scripting involves guiding the execution flow of a script based on various conditions.

#### Conditional Statements

1) if-else Statements

The if statement tests a condition. If true, it executes a specific block of code.

Example
```
if [ $age -ge 18 ]; then
    echo "You are eligible to vote."
else
    echo "You are not eligible to vote."
fi
```

Real World Example - Check if the Log file exists and archive it if it does.

```
#!/bin/bash
# Script to check if the Log file exists and archive it if it does.

# Log File Path
LOG_FILE_PATH="/opt/access.log"
FILE_ARCHIVE_PATH="/opt/archive"

# Check if the file exists
if [ -f "$LOG_FILE_PATH" ]; then
    echo "Log file exists. Archiving statrted"
    mkdir -p "$FILE_ARCHIVE_PATH"
    mv "$LOG_FILE_PATH" "$FILE_ARCHIVE_PATH/$(date +'%Y-%m-%d_%H-%M-%S')_access.log"
    echo "Log file archived completed."
else
    echo "Log file does not exist."
fi
```

Output
```
nixmin@DESKTOP:~/$ sudo ./log_file_archive.sh 
[sudo] password for nixmin: 
Log file exists. Archiving statrted
Log file archived completed.

nixmin@DESKTOP-GINCH92:~/$ ls -l /opt/archive/
total 4
-rw-r--r-- 1 root root 29 Jun 17 16:47 2024-06-17_16-49-13_access.log
```

2) case Statements

The case statement matches a variable against multiple patterns and executes corresponding blocks of code.

Example
```
case $day in 
    "Monday")
        echo "Start of the workweek."
    ;;
    Friday)
        echo "End of the workweek."
    ;;
*)
    echo "It's just another day."
    ;;
esac    
```

#### Looping Statements

1) for loop

The for loop iterates over a list of items and executes a block of code for each item.

Example
```
#!/bin/bash
# Print each number from 1 to 5

for i in {1..5}; do
    echo "$i"
done

output

1
2
3
4
5
```

Real World Example

```
#!/bin/bash
# 






```





2) while loop

The while loop repeatedly executes a block of code as long as a given condition is true.

Example
```
#!/bin/bash
# while loop example

count=1
while [ $count -le 5 ]; do
	echo "Count: $count"
	count=$((count + 1))
done

output

Count: 1
Count: 2
Count: 3
Count: 4
Count: 5
```

3) until Loops

The until loop runs until a condition becomes true.

Example
```
#!/bin/bash
# until loop example

count=1
until [ $count -gt 5 ]; do
    echo "Count: $count"
    count=$((count + 1))
done

output

Count: 1
Count: 2
Count: 3
Count: 4
Count: 5
```

#### Control Flow Commands

1) break

The break command exits the nearest enclosing loop.

Example
```
#!/bin/bash
# break example

for i in {1..5}; do
    if [ $i -eq 2 ]; then
        break
    fi
    echo "Number: $i"
done

output

Number: 1
Number: 2
Number: 3
```

2) continue

The continue command skips remaining commands in the current loop iteration and starts the next iteration.

Example
```
#!/bin/bash
# continue example

for in in {1..8}; do 
    if [ $i -eq 7]; then
        continue
    fi
    echo "Number: $i"
done

output

Number: 1
Number: 2
Number: 3
Number: 4
Number: 6
Number: 7
Number: 8
Number: 9
Number: 10
```