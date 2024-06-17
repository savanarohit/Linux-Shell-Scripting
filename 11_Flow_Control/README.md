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
```

