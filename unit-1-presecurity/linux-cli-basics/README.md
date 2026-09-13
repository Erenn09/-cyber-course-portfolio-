# Linux CLI Basics

## Goal

The goal of this assignment was to become comfortable with essential Linux command-line tools. I practiced navigation, file manipulation, viewing files, searching, redirection, pipes, permissions, processes, networking and package management on Debian 13.

## Source

Linux CLI Basics – Unit 1 Presecurity

## Environment

* OS: Debian GNU/Linux 13 (trixie)
* Debian version: 13.6
* Architecture: x86_64
* Virtual machine: Debian 13 VM

---

# Part 1 Getting your bearings

## Q1 — What username are you logged in as?

Command:

```bash
$ whoami
```

Output:

```text
varia
```

**Answer:** I am logged in as `varia`.

## Q2 — Are you a member of the `sudo` group? How can you tell from the output of `id`?

Command:

```bash
$ id
```

**Answer:** The account has sudo access, which I could confirm because commands such as `sudo apt update` and `sudo apt upgrade` worked successfully. The exact `id` output was not saved, so I am not adding a made-up group list.

## Q3 — What kernel version is your system running?

Command:

```bash
$ uname -a
```

**Answer:** The system is running the Linux kernel `6.12.107+deb13-amd64`.

## Q4 — What is the difference in the depth of information they give you?

Commands:

```bash
$ whatis whoami
$ man whoami
```

**Answer:** `whatis` gives a short description of the command. `man` gives much more detailed information, including the command description, syntax and available options.

## Q5 — While in `man`, how do you (a) search for the word "user" and (b) quit?

**Answer:**

To search for `user`, I used:

```text
/user
```

Then I pressed:

```text
q
```

to quit the manual.

---

# Part 2 Navigation

## Q6 — What did `cd -` do?

Commands:

```bash
$ cd /etc
$ cd ..
$ cd /var/log
$ cd -
$ cd ~
$ cd /
```

**Answer:** `cd -` changed back to the previous working directory.

## Q7 — What additional information does `-l` give you over plain `ls`?

Command:

```bash
$ ls -l /etc
```

**Answer:** `-l` shows the long listing format. It includes permissions, link count, owner, group, file size, modification date and filename.

## Q8 — What does `-a` show that wasn't visible before? Name two examples from the output.

Command:

```bash
$ ls -la /etc
```

**Answer:** `-a` also shows hidden files and directories. Two examples are:

```text
.
..
```

## Q9 — What is the largest file in `/var/log`? What size is it?

Command:

```bash
$ ls -lh /var/log
```

Output:

```text
-rw-r--r-- 1 root root 806K Sep  1 10:28 dpkg.log
```

**Answer:** The largest file was `dpkg.log`, with a size of **806K**.

## Q10 — What was modified most recently?

Command:

```bash
$ ls -lt /var/log
```

Output excerpt:

```text
-rw-r--r-- 1 root root 8192 Sep 13 14:41 wtmp.db
-rw-rw---- 1 root utmp 9984 Sep 13 14:41 wtmp
```

**Answer:** `wtmp.db` and `wtmp` were the most recently modified entries, both at Sep 13 14:41.

---

# Part 3 Creating and managing files

## Q11 — Show the command (or commands) you used.

Command:

```bash
$ mkdir -p ~/cyber-course/{unit1,unit2,unit3/{osint,recon,crypto},scratch}
```

I created the required directory structure with `mkdir -p`.

I then created the files:

```bash
$ touch ~/cyber-course/scratch/a.txt
$ touch ~/cyber-course/scratch/b.txt
$ touch ~/cyber-course/scratch/c.txt
```

I copied and moved them with:

```bash
$ cp ~/cyber-course/scratch/a.txt ~/cyber-course/unit1/intro.txt
$ mv ~/cyber-course/scratch/b.txt ~/cyber-course/unit2/
$ mv ~/cyber-course/scratch/c.txt ~/cyber-course/scratch/notes.txt
```

## Q12 — What key combination did you use to save? What key combination did you use to exit?

Command:

```bash
$ nano ~/cyber-course/unit1/intro.txt
```

I entered:

```text
This is my first file edited from the Linux command line.
Today I learned that mv is also rename, and that nano shows shortcuts at the bottom.
```

**Answer:** I used `Ctrl+O` to save, pressed `Enter` to confirm the filename, and used `Ctrl+X` to exit.

I checked the contents with:

```bash
$ cat ~/cyber-course/unit1/intro.txt
```

Output:

```text
This is my first file edited from the Linux command line.
Today I learned that mv is also rename, and that nano shows shortcuts at the bottom.
```

## Q13 — Why did `rmdir` fail (or succeed)?

Command:

```bash
$ rmdir ~/cyber-course/scratch/
```

Output:

```text
rmdir: failed to remove '/home/varia/cyber-course/scratch/': Directory not empty
```

**Answer:** `rmdir` failed because `scratch` still contained files. `rmdir` only removes empty directories.

I then removed it properly with:

```bash
$ rm -r ~/cyber-course/scratch/
```

---

# Part 4 Viewing files

## Q14 — Which Debian version do you have?

Command:

```bash
$ cat /etc/os-release
```

Output:

```text
PRETTY_NAME="Debian GNU/Linux 13 (trixie)"
VERSION_ID="13"
VERSION="13 (trixie)"
VERSION_CODENAME=trixie
DEBIAN_VERSION_FULL=13.6
```

**Answer:** I have **Debian GNU/Linux 13 (trixie), version 13.6**.

## Q15 — What kind of messages do you see? Are they recent?

The assignment command was:

```bash
$ sudo tail -n 10 /var/log/syslog
```

My Debian VM did not have `/var/log/syslog`, so it returned:

```text
tail: cannot open '/var/log/syslog' for reading: No such file or directory
```

I used the system journal instead:

```bash
$ sudo journalctl -n 10
```

The output contained messages from services such as `vboxadd-service`, `gdm-password`, `gnome-shell`, `NetworkManager` and `sudo`.

**Answer:** These were recent system and service messages. The timestamps showed that they were recent.

---

# Part 5 Searching

## Q16 — How many lines were returned?

Command:

```bash
$ grep "ssh" /etc/services
```

Output:

```text
ssh        22/tcp        # SSH Remote Login Protocol
```

I counted the results with:

```bash
$ grep "ssh" /etc/services | wc -l
```

Output:

```text
1
```

**Answer:** **1 line** was returned.

## Q17 — How would you modify the command to show only `.conf` files modified in the last 7 days?

Command:

```bash
$ find /etc -name "*.conf" -mtime -7
```

Output included:

```text
/etc/resolv.conf
/etc/cups/subscriptions.conf
```

There were also some `Permission denied` messages for protected directories.

**Answer:** I added `-mtime -7` to the original command. This finds `.conf` files modified less than 7 days ago.

## Q18 — Where are these commands actually located on the filesystem?

Commands:

```bash
$ which ls
$ which nano
```

Output:

```text
/usr/bin/ls
/usr/bin/nano
```

**Answer:**

```text
ls   -> /usr/bin/ls
nano -> /usr/bin/nano
```

---

# Part 6 History, redirection, and pipes

## Q19 — What does the `|` symbol do here?

Command:

```bash
$ history | tail -n 20
```

**Answer:** The pipe sends the output from `history` to `tail`. In this case, `tail` displays the last 20 lines of the command history.

## Q20 — What is the difference between `>` and `>>`?

Commands:

```bash
$ ls -la ~/cyber-course/ > ~/listing.txt
$ cat ~/listing.txt
$ date >> ~/listing.txt
$ cat ~/listing.txt
```

Output:

```text
total 20
drwxrwxr-x  5 varia varia 4096 Sep 13 15:12 .
drwx------ 16 varia varia 4096 Sep 13 17:11 ..
drwxrwxr-x  2 varia varia 4096 Sep 13 15:07 unit1
drwxrwxr-x  2 varia varia 4096 Sep 13 15:04 unit2
drwxrwxr-x  5 varia varia 4096 Sep 13 14:59 unit3
Sun 13 Sep 17:11:39 EEST 2026
```

**Answer:** `>` writes to a file and overwrites the existing contents. `>>` adds the new output to the end of the file.

## Q21 — What was the output, and why?

Command:

```bash
$ echo "hello cyber world" | grep "cyber"
```

**Answer:** The output was:

```text
hello cyber world
```

This happened because the sentence contains the word `cyber`, so `grep` printed the matching line.

I also searched my history with:

```bash
$ history | grep "cd "
```

This returned my previous `cd` commands.

I tested both:

```bash
$ clear
```

and:

```text
Ctrl+L
```

Both clear the visible terminal screen.

---

# Part 7 Archives

## Q22 — Confirm with `ls -la` that the extraction worked. What did you find inside?

I created the ZIP archive with:

```bash
$ zip -r ~/unit1.zip ~/cyber-course/unit1/
```

I listed it with:

```bash
$ unzip -l ~/unit1.zip
```

The archive contained:

```text
home/varia/cyber-course/unit1/
home/varia/cyber-course/unit1/intro.txt
```

I extracted it with:

```bash
$ unzip ~/unit1.zip -d ~/unit1-extracted
```

The extracted directory contained:

```text
intro.txt
```

**Answer:** The extraction worked and I found `intro.txt` inside the `unit1` directory.

## Q23 — What do the flags `c`, `z`, `v`, and `f` each mean?

Command:

```bash
$ tar -czvf ~/unit2.tar.gz ~/cyber-course/unit2/
```

**Answer:**

* `c` = create
* `z` = gzip compression
* `v` = verbose output
* `f` = specify the archive file

I checked the archive with:

```bash
$ tar -tzvf ~/unit2.tar.gz
```

---

# Part 8 Permissions

## Q24 — Paste the permission string. Can the owner execute the file?

Command:

```bash
$ touch ~/cyber-course/hello.sh
$ ls -l ~/cyber-course/hello.sh
```

Output:

```text
-rw-rw-r-- 1 varia varia 0 Sep 13 17:21 /home/varia/cyber-course/hello.sh
```

**Answer:** The permission string is:

```text
-rw-rw-r--
```

No, the owner cannot execute the file because there is no `x` permission.

## Q25 — What happened, and why?

I added the script:

```text
#!/bin/bash
echo "Hello from my first script"
```

Then I tried:

```bash
$ ~/cyber-course/hello.sh
```

Output:

```text
bash: /home/varia/cyber-course/hello.sh: Permission denied
```

**Answer:** The script could not run because it did not have execute permission.

## Q26 — What does the new permission string look like? Did the script run this time?

Command:

```bash
$ chmod u+x ~/cyber-course/hello.sh
$ ls -l ~/cyber-course/hello.sh
```

Output:

```text
-rwxrw-r-- 1 varia varia 47 Sep 13 17:22 /home/varia/cyber-course/hello.sh
```

I ran the script again:

```bash
$ ~/cyber-course/hello.sh
```

Output:

```text
Hello from my Linux script!
```

**Answer:** The new permission string was `-rwxrw-r--`. Yes, the script ran successfully after execute permission was added.

## Q27 — What does `700` mean in plain language?

Command:

```bash
$ chmod 700 ~/cyber-course/hello.sh
$ ls -l ~/cyber-course/hello.sh
```

Output:

```text
-rwx------ 1 varia varia 47 Sep 13 17:22 /home/varia/cyber-course/hello.sh
```

**Answer:** `700` means the owner has read, write and execute permissions. The group and everyone else have no permissions.

---

# Part 9 Processes and system info

## Q28 — What does the `USER` column show?

Command:

```bash
$ ps aux | head -n 10
```

Output excerpt:

```text
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root           1  0.0  0.7  23876 15060 ?        Ss   14:40   0:06 /sbin/init
root           2  0.0  0.0      0     0 ?        S    14:40   0:00 [kthreadd]
```

**Answer:** The `USER` column shows which user owns or runs the process.

## Q29 — How much disk space is your `cyber-course` directory using?

Commands:

```bash
$ df -h
$ du -sh ~/cyber-course/
```

Output:

```text
/dev/sda1        30G  5.8G   23G  21% /
```

and:

```text
36K    /home/varia/cyber-course
```

**Answer:** My `cyber-course` directory was using **36K** of disk space.

## Q30 — How much RAM does your VM have, and how much is currently used?

Command:

```bash
$ free -h
```

Output:

```text
               total        used        free      shared  buff/cache   available
Mem:           1.9Gi       1.0Gi       214Mi       9.6Mi       872Mi       921Mi
Swap:          1.7Gi          0B       1.7Gi
```

**Answer:** The VM has **1.9 GiB of RAM**, with about **1.0 GiB currently used**. Swap is 1.7 GiB and none is currently used.

---

# Part 10 Networking and downloads

## Q31 — What is your VM's IP address on the primary interface?

Command:

```bash
$ ip a
```

The primary interface was:

```text
enp0s3
```

**Answer:** The VM had a private IPv4 address in the `10.0.2.0/24` network. I am not publishing the exact IP address in this public GitHub README.

## Q32 — Did both succeed? If one failed, what is the most likely reason?

Commands:

```bash
$ ping -c 4 1.1.1.1
$ ping -c 4 example.com
```

Both succeeded.

For `1.1.1.1`:

```text
4 packets transmitted, 4 received, 0% packet loss
rtt min/avg/max/mdev = 20.173/27.050/40.847/8.217 ms
```

For `example.com`:

```text
4 packets transmitted, 4 received, 0% packet loss
rtt min/avg/max/mdev = 26.183/28.718/33.601/2.876 ms
```

**Answer:** Yes, both tests succeeded. Both had 0% packet loss.

## Q33 — Are the two files identical?

I downloaded the Debian page with `wget` and then with `curl`.

The curl command was:

```bash
$ curl https://www.debian.org/ > debian-curl.html
```

Then I compared the files:

```bash
$ diff index.html debian-curl.html
```

There was no output.

**Answer:** Yes, the files were identical because `diff` showed no differences.

---

# Part 11 Package management and sudo

## Q34 — Did `sudo` ask for a password? Whose password?

Command:

```bash
$ sudo apt update
```

The terminal asked:

```text
[sudo] password for varia:
```

**Answer:** Yes. It asked for the password of the current user, `varia`.

The package catalog was successfully updated and the system reported:

```text
88 packages can be upgraded.
```

## Q35 — Were any packages upgraded? Roughly how many?

Commands:

```bash
$ apt list --upgradable
$ sudo apt upgrade
```

The upgrade summary was:

```text
Upgrading: 88
Installing: 0
Removing: 0
Not Upgrading: 0
```

**Answer:** Yes. **88 packages** were upgraded.

## Q36 — What's one thing `htop` shows you that `top` did not?

I installed `htop` with:

```bash
$ sudo apt install htop
```

Then checked it:

```bash
$ which htop
```

Output:

```text
/usr/bin/htop
```

I also ran:

```bash
$ htop
```

and exited with `q`.

I checked the package information:

```bash
$ apt show htop
```

Relevant output:

```text
Package: htop
Version: 3.4.1-5
Description: interactive processes viewer
```

**Answer:** `htop` gives a more interactive and easier-to-navigate view of processes. It allows scrolling through the process list and shows full command lines more conveniently than `top`.

## Q37 — What is `nmap`, according to the description?

Command:

```bash
$ apt search nmap
```

Output:

```text
nmap/stable 7.95-3 amd64
  The Network Mapper
```

**Answer:** According to the package description, `nmap` is **The Network Mapper**. It is a network scanning tool.

---

# Part 12 Putting it together

## Q38 — Paste the commands you used. The output redirection (`>` and `>>`) is the key here.

I created the report directory:

```bash
$ mkdir -p ~/cyber-course/report
```

Then I created `system-info.txt` using output redirection:

```bash
$ echo "Hostname:" > ~/cyber-course/report/system-info.txt
$ hostname >> ~/cyber-course/report/system-info.txt

$ echo "Username:" >> ~/cyber-course/report/system-info.txt
$ whoami >> ~/cyber-course/report/system-info.txt

$ echo "Kernel:" >> ~/cyber-course/report/system-info.txt
$ uname -a >> ~/cyber-course/report/system-info.txt

$ echo "Disk usage:" >> ~/cyber-course/report/system-info.txt
$ df -h >> ~/cyber-course/report/system-info.txt

$ echo "Date:" >> ~/cyber-course/report/system-info.txt
$ date >> ~/cyber-course/report/system-info.txt
```

I checked the file with:

```bash
$ cat ~/cyber-course/report/system-info.txt
```

Then I created the ZIP archive:

```bash
$ zip -r ~/report.zip ~/cyber-course/report/
```

Output:

```text
adding: home/varia/cyber-course/report/
adding: home/varia/cyber-course/report/system-info.txt
```

Finally, I verified it:

```bash
$ unzip -l ~/report.zip
```

The archive contained:

```text
home/varia/cyber-course/report/
home/varia/cyber-course/report/system-info.txt
```

---

# Reflection

Thoughts

To be honest, there wasn’t a command that really surprised me, maybe the ones used to create files.

The command I think I’ll use most often is `ls`, because I always need it when I want to check files, directories, or permissions. 

One of the topics that’s still a bit confusing in the Linux command line is permissions. At first, it was hard to read strings like `-rwx------`. That difficulty persists; it’s still very hard to read.



