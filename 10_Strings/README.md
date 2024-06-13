#### Strings

Strings are a fundamental data type in Bash shell scripting, used to store and manipulate text. They are sequences of characters that can include letters, numbers, symbols, and spaces.

#### Bashic String Example

```
nixmin@DESKTOP:~$ my_string="Hello Bash!"
nixmin@DESKTOP:~$ echo my_string
my_string
```

#### String Susbstition

String substitution in Bash shell scripting is a powerful feature that allows you to manipulate strings in various ways. It includes replacing substrings, removing parts of strings, and extracting specific segments. 

Basics of String Substitution

String substitution in Bash uses parameter expansion syntax to replace or extract portions of strings. Here are the fundamental substitution operations:

1) Substitution with ${variable/pattern/replacement}:

Replaces the first occurrence of pattern with replacement.
Syntax: ${variable/pattern/replacement}

2) Global Substitution with ${variable//pattern/replacement}:

Replaces all occurrences of pattern with replacement.
Syntax: ${variable//pattern/replacement}

3) Substitution at the Start of a String with ${variable/#pattern/replacement}:

Replaces the pattern only if it matches the beginning of the string.
Syntax: ${variable/#pattern/replacement}

4) Substitution at the End of a String with ${variable/%pattern/replacement}:

Replaces the pattern only if it matches the end of the string.
Syntax: ${variable/%pattern/replacement}
