### Linux Shell Scripting

#### Comments
We use hash in a linux shell script

```
#!/bin/bash
# This is a comment
```

#### Multiple commands 
```
command1;command2;command3;

We can also use curely braces directly on the command line 

{ 
command1
command2
command3
}
```

#### Quotation
```
var="test"
echo $var
```

#### Shell Expansion
```
{1..10}
{A..G}

touch file{1..4}
mkdir {1..4}_
```

#### List of Users  

```
cat /etc/passwd
cat /etc/passwd | awk -F ":" '{print $1}'
```

#### Output redirection to set a variable
```
user=$(cat /etc/passwd | awk -F ":" '{print $1}')

Example

nixmin@DESKTOP-GINCH92:~$ list=$(cat /etc/passwd | awk -F ":" '{print $1}')

nixmin@DESKTOP-GINCH92:~$ echo $list
root daemon bin sys sync games man lp mail news uucp proxy www-data backup list irc gnats nobody systemd-network systemd-resolve messagebus systemd-timesync syslog _apt uuidd tcpdump nixmin glances
```

#### Commandline Parameters
```
vi myshell.sh

#!/bin/bash
echo $0
echo $1
echo $2

nixmin@DESKTOP-GINCH92:~/shell-script/1_Advance_Shell_Scripting$ ./myshell.sh Rohit Amit
Rohit
Amit

nixmin@DESKTOP-GINCH92:~/shell-script/1_Advance_Shell_Scripting$ ./myshell.sh Rohit
./myshell.sh
Rohit

```