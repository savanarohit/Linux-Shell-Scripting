#### Flow Control

Flow control in Linux shell scripting involves guiding the execution flow of a script based on various conditions.

#### Conditional Statements

1. if-else Statements

The if statement tests a condition. If true, it executes a specific block of code.

Example
```
if [ $age -ge 18 ]; then
    echo "You are eligible to vote."
else
    echo "You are not eligible to vote."
fi

```

2. case Statements

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
