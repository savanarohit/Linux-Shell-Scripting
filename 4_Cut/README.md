#### Cut command

The cut command in Unix and Linux is used to extract sections from each line of a file or from standard input. It is a powerful tool for working with text files and can be used to select specific columns or fields from the input.

#### Cut command options

cut OPTION [FILE...]

##### Cut command options

-f, --fields=LIST : Select only these fields (columns); used with a delimiter.
-d, --delimiter=DELIM : Use a specific delimiter instead of the default tab.
-c, --characters=LIST : Select only these characters.
-b, --bytes=LIST : Select only these bytes.

#### Examples 
```
nixmin@DESKTOP:~$ cat /etc/passwd | cut -d ":" -f 1
root
daemon
bin
sys
sync
games
man
lp
mail
```

```
nixmin@DESKTOP:~$ cat /etc/passwd | cut -d ":" -f 6
/root
/usr/sbin
/bin
/dev
/bin
/usr/games
/var/cache/man
/var/spool/lpd
/var/mail
/var/spool/news
/var/spool/uucp
/bin
/var/www
/var/backups
```

```
nixmin@DESKTOP:~$ httpd -v | cut -d "/" -f 2
2.4.6 (CentOS)
Server build: Jan 25 2024
```



