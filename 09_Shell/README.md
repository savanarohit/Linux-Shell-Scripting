#### Linux Shell

The Linux shell is a command-line interface (CLI) that allows users to interact with the operating system by typing commands. It provides a text-based way to communicate with the Linux kernel, manage system resources, run programs, and perform various tasks.

#### Key Components of the Linux Shell

1) Command Interpreter: The shell is an intermediary between the user and the kernel. It interprets and executes the commands entered by the user.

2) Environment: The shell maintains an environment that includes variables and configurations that can influence the behavior of the commands and programs run within the shell.

3) Scripting Language: Many shells support scripting, which allows users to write scripts (collections of commands) to automate tasks.

#### Common Types of Linux Shells

1) Bash (Bourne Again Shell): The default shell for many Linux distributions. It is an enhanced version of the original Bourne Shell (sh), including command-line editing, job control, and command history.

2) Zsh (Z Shell): Known for its powerful features like spell checking, improved auto-completions, and themes. It is highly customizable.

3) Ksh (Korn Shell): Combines features of the Bourne Shell and the C Shell. It is used for scripting and is compatible with many Unix systems.

#### Core Functions of the Linux Shell

1) Command Execution: Allows users to execute various commands to interact with the file system, run applications, and manage system processes.

2) Job Control: Enables users to start, stop, and manage multiple processes (jobs) simultaneously.

3) Input and Output Redirection: Users can redirect input and output of commands to and from files, other commands, or devices.

4) Piping: Facilitates chaining commands together, where the output of one command is used as input for another.

5) Environment Management: Allows setting and managing environment variables that can affect how commands and applications run.

6) Script Execution: Supports writing and executing shell scripts for automating tasks.

#### Example of Common Shell Commands

1) ls: Lists files and directories.

2) cd: Changes the current directory.

3) mkdir: Creates a new directory.

4) cp: Copies files or directories.

#### How to get help in Linux shell

```
nixmin@DESKTOP:~$ man ls

NAME
       ls - list directory contents

SYNOPSIS
       ls [OPTION]... [FILE]...

DESCRIPTION
       List  information  about the FILEs (the current directory by default).  Sort entries alphabetically if none of
       -cftuvSUX nor --sort is specified.

       Mandatory arguments for long options are mandatory for short options too.

       -a, --all
              do not ignore entries starting with.

       -A, --almost-all
              do not list implied . and ..

```

#### Linux Shell Built-in commands

Shell built-in commands are integral components of the shell environment that allow users to perform essential operations without invoking external programs or commands.

#### Key Characteristics of Shell Built-in Commands

1) Internal Execution:

Built-in commands are executed by the shell itself rather than spawning a new process. This makes them faster than external commands because no additional overhead is required to create a new process.

2) Access to Shell's Internal State:

They can manipulate the shell's environment and internal variables directly. This includes operations like setting environment variables, changing directories, and altering the shell's behavior.

3) Essential for Shell Functionality:

Some tasks can only be performed by built-ins. For example, changing the current directory (cd) or manipulating shell variables (export) are tasks that require direct access to the shell's internals.

4) Command Availability:

Built-in commands are always available in the shell, unlike external commands that might depend on the system's PATH or other configurations.

#### Common Examples of Shell Built-in Commands

cd 
echo
exit
set
unset
export
alias
source
pwd
history

#### How to List All the Built-in Commands

Most shells provide a way to list all available built-in commands. For example:
Bash: You can use the help command to list built-ins, or compgen -b to get a concise list of all built-ins.

```
nixmin@DESKTOP:~$ compgen -b
.
:
[
alias
bg
bind
break
builtin
caller
cd
command
```

#### How to know if a command is Built-in
```
We can use type command

nixmin@DESKTOP:~$ type cd
cd is a shell builtin

nixmin@DESKTOP:~$ type df
df is /usr/bin/df
```

#### Predefined Linux Shell Variables
```
nixmin@DESKTOP:~$ echo $SHELL
/bin/bash

nixmin@DESKTOP:~$ echo $HOME
/root

nixmin@DESKTOP:/etc$ cd $HOME
nixmin@DESKTOP:~$

```

#### Linux Shell Environment Variables
```
nixmin@DESKTOP:~/linux-shell-scripting$ env
SHELL=/bin/bash
NAME=DESKTOP
LOGNAME=nixmin
```

#### Useful Linux Shell Commands
```
nixmin@DESKTOP:~$ cat /etc/passwd
nixmin@DESKTOP:~$ grep "root" /etc/passwd
nixmin@DESKTOP:~$ sed 's/apple/oragne/' fruits.txt
nixmin@DESKTOP:~$ set 's/apple/oragne/g' fruits.txt
nixmin@DESKTOP:~$ cat /etc/passwd | awk -F ":" '{print $NF}'
```

#### Local Variable
```
#!/bin/bash
# Script explaining Local variables

hello() {
       name="Rohit"
       echo "$name"
}
```



