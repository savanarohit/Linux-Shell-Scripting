#### AWK

AWK is a powerful and versatile programming language primarily used for pattern scanning and processing. AWK is commonly used for data extraction and reporting. It reads input line by line, splits each line into fields, and then processes the fields according to specified rules.

#### AWK Command 

AWK can be used both as a command-line tool and as part of a shell script. The basic syntax for an AWK command is:

```
awk 'pattern {action}' input_file
```

pattern: Specifies a pattern to match.
action: Specifies what to do with the matched pattern.
input_file: The file to be processed.

##### AWK Structure

BEGIN block: Executed before any input lines are read.
Main block: Executed for each line in the input.
END block: Executed after all input lines have been processed.
```
awk 'BEGIN { ... } { ... } END { ... }' input_file
```

##### AWK Field Variables
```
awk 'pattern {print $1}' input_file
```

$0: Represents the entire line.
$1, $2, ..., $n: Represents the first, second, ..., nth field in the line.
Fields are typically separated by whitespace or can be defined using the -F option.

#### Example - Basic usage

Example 1: Print the Third Field
Let's consider a file data.txt with the following content:

John 25 50000
Jane 30 60000
Doe 22 45000

We want to print the third field (salary).
```
awk '{ print $3 }' data.txt
```

#### Example - Search for a username
```
nixmin@DESKTOP:~$ awk '/root/ {print $1}' /etc/passwd
root:x:0:0:root:/root:/bin/bash

nixmin@DESKTOP:~$ awk '/ro/ {print $1}' /etc/passwd
root:x:0:0:root:/root:/bin/bash
proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
systemd-timesync:x:103:106:systemd
```

#### Example - Get all the usernames
```
nixmin@DESKTOP:~$ awk -F ":" '{print $1}' /etc/passwd
root
daemon
bin
sys
sync
games
man
lp
```

#### Example - Get all the usernames with home dir
```
nixmin@DESKTOP:~$ awk -F ":" '{print $1,$6}' /etc/passwd
root /root
daemon /usr/sbin
bin /bin
sys /dev
sync /bin
games /usr/games
```

#### AWK - NR and NF

In AWK, NR and NF are built-in variables that provide useful information about the data being processed.

#### NR (Number of Records)

Definition: NR stands for Number of Records. It keeps a count of the number of input records (usually lines) that have been processed so far.

Usage: NR is used to keep track of the line number currently being processed. It starts from 1 and increments with each new line.

Common Use Cases:

Skipping headers.
Displaying line numbers.
Conditional processing based on line number.


#### Example - (AWK NR) Print complete file with line number
```
nixmin@DESKTOP:~$ awk '{print NR,$0}' /etc/passwd
1 root:x:0:0:root:/root:/bin/bash
2 daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
3 bin:x:2:2:bin:/bin:/usr/sbin/nologin
4 sys:x:3:3:sys:/dev:/usr/sbin/nologin
5 sync:x:4:65534:sync:/bin:/bin/sync
6 games:x:5:60:games:/usr/games:/usr/sbin/nologin
7 man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
8 lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
```

#### NF (Number of Fields)

Definition: NF stands for Number of Fields. It represents the number of fields in the current record.
Usage: NF is used to determine the number of fields in each line, which can vary if the data is irregular.
Common Use Cases:
Identifying lines with a specific number of fields.
Iterating through fields.
Filtering lines based on the number of fields.

#### Example - (AWS NF) To print lines that have exactly three fields:
```
awk 'NF == 3 { print $0 }' data.txt
```

Explanation:

NF == 3: The condition checks if the current line has exactly three fields.
print $0: Prints the entire line if the condition is true.

#### Example - Web Server Log Analysis 

Imagine you have a web server log file access.log containing entries in the Common Log Format (CLF). Each line in the log file looks like this:

```
127.0.0.1 - - [08/Jun/2024:14:12:34 +0000] "GET /index.html HTTP/1.1" 200 1234
192.168.1.1 - - [08/Jun/2024:14:12:35 +0000] "POST /login HTTP/1.1" 401 543
203.0.113.5 - - [08/Jun/2024:14:12:36 +0000] "GET /about.html HTTP/1.1" 200 2345

Each line contains the following fields:

IP Address: The client's IP address.
RFC1413 identity: Usually a dash (-).
User ID: Usually a dash (-).
Date/Time: The date and time of the request.
Request: The HTTP request line from the client.
Status Code: The HTTP status code returned to the client.
Bytes Sent: The size of the object returned to the client.

We will create a shell script using AWK to perform several tasks:

Count the number of requests.
Identify the top IP addresses.
Summarize HTTP status codes.
Calculate the total bytes sent

```

```
log_analyzer.sh

#!/bin/bash

# Log file
log_file="access.log"

# Check if the log file exists
if [[! -f $log_file]]; then
    echo "Log File not found"
    exit 1
fi

# Count the number of requests
echo "Total number of requests:"
awk 'END {print NR}' "$log_file"

# Top 5 IP addresses making requests
echo "Top 5 IP addresses making requests:"
awk '{print $1}' "log_file" | sort | uniq -c | sort -nr | head -5

# HTTP status code
echo "HTTP status code summary:"
awk '{status[$9]++} END { for (code in status) print code,status[code]}' "log_file" | sort -k2 -nr

# Calculate the total bytes sent
echo "Total bytes sent"
awk '{sum +=$10} END { print sum }' "log_file"

```

Output Example

Total number of requests:
500
Top 5 IP addresses making requests:
100 203.0.113.5
90 192.168.1.1
80 127.0.0.1
...
HTTP status code summary:
200 400
404 50
500 10
...
Total bytes sent:
12345678


Explanation

1) Count the Number of Requests

```
awk 'END { print NR }' "$log_file"

NR keeps a count of the number of lines (records) processed. This prints the total number of requests.
```

2) Identify Top 5 IP Addresses
```
awk '{ print $1 }' "$log_file" | sort | uniq -c | sort -nr | head -5

{ print $1 }: Extracts the first field (IP address).
sort: Sorts the IP addresses.
uniq -c: Counts unique occurrences of each IP address.
sort -nr: Sorts the counts in descending order.
head -5: Displays the top 5 IP addresses.
```

3) HTTP Status code

```
awk '{ status[$9]++ } END { for (code in status) print code, status[code] }' "$log_file" | sort -k2 -nr

status[$9]++: Creates an associative array status to count occurrences of each status code (field 9).
END { for (code in status) print code, status[code] }: After processing all lines, prints each status code and its count.
sort -k2 -nr: Sorts the summary by count in descending order.
```

4) Calculate the Total Bytes Sent:
```
awk '{ sum += $10 } END { print sum }' "$log_file"

sum += $10: Sums up the bytes sent (field 10).
END { print sum }: Prints the total number of bytes sent after processing all lines.


```

