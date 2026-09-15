# U1-06b Assignment: Shell Scripting Basics

## Goal

Learn basic shell scripting by customizing `~/.bashrc`, using variables, user input, conditionals, loops, and creating a simple Bash script.

## Source

U1-06b Assignment: Shell Scripting Basics

## Environment

* Debian GNU/Linux 13 (trixie)
* Bash
* VM hostname: `debian-lab`
* User: `varia`

---

# Part 1 - Exploring `~/.bashrc`

## Q1

```text
-rw-r--r-- 1 varia varia 3526 Aug 28 13:59 .bashrc
```

The file size is **3526 bytes** and it was last modified on **August 28 at 13:59**.

## Q2

```bash
# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
```

This section changes the terminal title to show the username, hostname, and current directory when using xterm or rxvt.

## Q3

Debian's default `.bashrc` already has an active alias:

```bash
alias ls='ls --color=auto'
```

The file also contains commented-out example aliases.

---

# Part 2 - Backup before editing

## Q4

The backup was created with:

```bash
cp ~/.bashrc ~/.bashrc.backup
```

Both `.bashrc` and `.bashrc.backup` were confirmed to exist.

---

# Part 3 - Adding a welcome banner

## Q5

The first banner displayed:

```text
Hello, Linuxuser
```

## Q6

The personalized banner displayed:

```text
===============================
  Welcome back, varia
  Host: debian-lab
  Today: Tuesday, 15 September 2026
===============================
```

## Q7

`$(whoami)` runs the `whoami` command and inserts its output into the text. `$()` is command substitution, so the command inside the parentheses is executed and its result is used.

---

# Part 4 - Adding aliases

## Q8

The two aliases added were:

```bash
alias ll='ls -la'
alias gohome='cd ~/cyber-course'
```

Running `gohome` and then `pwd` resulted in:

```text
/home/varia/cyber-course
```

Running `ll` displayed the files and directories in the current directory.

## Q9

There are **3 active aliases** in the shell: the Debian default `ls` alias and the two custom aliases.

## Q10

`gohome` is useful because it quickly takes me back to my cybersecurity course directory without typing the full path.

---

# Part 5 - History settings

## Q11

The original values were:

```text
HISTSIZE=1000
HISTFILESIZE=2000
```

## Q12

The history file contained:

```text
32 /home/varia/.bash_history
```

So there were **32 lines** in the history file.

The last five lines were checked with:

```bash
tail -n 5 ~/.bash_history
```

## Q13

The new values were:

```text
HISTSIZE=10000
HISTFILESIZE=20000
```

## Q14

After running:

```bash
HISTSIZE=5
history
```

the history output showed **5 commands**.

## Q15

Two reasons someone with read access might care about the history file:

1. It may contain sensitive information such as passwords, tokens, or API keys that were accidentally entered.
2. It can reveal information about the system, files, directories, servers, and commands used by the user.

---

# Part 6 - Your first script

The script asks for a directory name, checks whether it exists, creates it if necessary, and creates five files.

The script was made executable with:

```bash
chmod +x make-files.sh
```

---

# Part 7 - Testing the script

## Q16 - New directory

First run:

```text
varia@debian-lab:~/cyber-course$ ./make-files.sh
Enter a directory name: test-run-1
Created directory: test-run-1
Created 5 files in test-run-1
```

Then:

```text
varia@debian-lab:~/cyber-course$ ls -la test-run-1/
total 8
drwxrwxr-x 2 varia varia 4096 Sep 15 13:00 .
drwxrwxr-x 7 varia varia 4096 Sep 15 13:00 ..
-rw-rw-r-- 1 varia varia    0 Sep 15 13:00 file1.txt
-rw-rw-r-- 1 varia varia    0 Sep 15 13:00 file2.txt
-rw-rw-r-- 1 varia varia    0 Sep 15 13:00 file3.txt
-rw-rw-r-- 1 varia varia    0 Sep 15 13:00 file4.txt
-rw-rw-r-- 1 varia varia    0 Sep 15 13:00 file5.txt
```

## Q17 - Existing directory

The second run produced:

```text
varia@debian-lab:~/cyber-course$ ./make-files.sh
Enter a directory name: test-run-1
Directory already exists: test-run-1
Created 5 files in test-run-1
```

The script still runs the loop and attempts to create the five files.

If a file already exists, `touch` does not overwrite or delete its contents. It updates the file's timestamp.

## Q18 - Empty input

When no directory name was entered:

```text
varia@debian-lab:~/cyber-course$ ./make-files.sh
Enter a directory name: 
Error: no name was given.
```

The script detects the empty input, displays an error message, and exits.

---

# Part 8 - Reading and improving

## Q19

I chose **Option C - Refuse to overwrite**.

The improvement makes the script stop if the directory already exists and contains files. This prevents the script from creating or modifying files in a non-empty existing directory.

The modified script is:

```bash
#!/bin/bash
# make-files.sh — Ask for a directory name, create it if needed,
#                 and populate it with 5 empty files.

read -p "Enter a directory name: " dirname

if [ -z "$dirname" ]; then
    echo "Error: no name was given."
    exit 1
fi

if [ -d "$dirname" ] && [ "$(ls -A "$dirname")" ]; then
    echo "Error: directory already exists and contains files: $dirname"
    exit 1
fi

if [ -d "$dirname" ]; then
    echo "Directory already exists: $dirname"
else
    mkdir "$dirname"
    echo "Created directory: $dirname"
fi

for i in {1..5}; do
    echo "This is file $i" > "$dirname/file${i}.txt"
done

echo "Created 5 files in $dirname"
```

When tested with an existing directory containing files, the script exits with an error instead of creating new files.

Example:

```text
varia@debian-lab:~/cyber-course$ ./make-files.sh
Enter a directory name: test-run-2
Error: directory already exists and contains files: test-run-2
```

---

# Your final script

See `make-files.sh` in this folder for the actual file. For reference:

```bash
#!/bin/bash
# make-files.sh — Ask for a directory name, create it if needed,
#                 and populate it with 5 empty files.

read -p "Enter a directory name: " dirname

if [ -z "$dirname" ]; then
    echo "Error: no name was given."
    exit 1
fi

if [ -d "$dirname" ] && [ "$(ls -A "$dirname")" ]; then
    echo "Error: directory already exists and contains files: $dirname"
    exit 1
fi

if [ -d "$dirname" ]; then
    echo "Directory already exists: $dirname"
else
    mkdir "$dirname"
    echo "Created directory: $dirname"
fi

for i in {1..5}; do
    echo "This is file $i" > "$dirname/file${i}.txt"
done

echo "Created 5 files in $dirname"
```

---

# Reflection

Before this assignment, shell scripting looked more complicated than it actually was. The easiest part was using simple commands and variables.

The harder part was understanding how conditionals work and what happens when a directory or file already exists.

The most useful thing I learned about .bashrc was that it can customize the shell every time a new terminal starts.

One thing I would want to script next is a small cybersecurity-related task, such as checking several system settings automatically and reporting anything that looks unusual.

