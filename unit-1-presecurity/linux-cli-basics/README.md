# Linux CLI Basics

## Goal

The goal of this assignment was to get more comfortable with the Linux command line. 

## Source

Linux CLI Basics – Unit 1 Presecurity

## Environment

* Debian GNU/Linux 13 (trixie)
* Debian version: 13.6
* Architecture: x86_64
* Debian 13 virtual machine



# Part 1 Getting your bearings

## Q1: What username are you logged in as?

Command:

$ whoami

Output:


varia


Answer: I am logged in as varia.

## Q2: Are you a member of the sudo group? How can you tell from the output of id?

Command:

$ id


Answer: Yes. The sudo group is shown in the groups part of the id output.

## Q3: What kernel version is your system running?

Command:

$ uname -a


Output:


Linux debian-lab 6.12.107+deb13-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.12.107-1 (2026-08-29) x86_64 GNU/Linux


Answer: 6.12.107+deb13-amd64.

## Q4: What is the difference in the depth of information they give you?

Commands:


$ whatis whoami

$ man whoami


Answer: whatis gives a short description of the command. man gives more detailed information, including the command description, syntax and options.

## Q5: While in man, how do you (a) search for the word "user" and (b) quit?

Answer: I searched for the word user by typing /user.




# Part 2 Navigation

## Q6: What did cd - do?

Commands:


$ cd /etc 


$ cd .. 


$ cd /var/log 


$ cd - 


$ cd ~ 


$ cd / 




Answer: cd - took me back to the previous directory.

## Q7: What additional information does -l give you over plain ls?

Command:

$ ls -l /etc


Answer: It shows permissions, owner, group, size, modification date and the name.

## Q8: What does -a show that wasn't visible before? Name two examples from the output.

Command:

$ ls -la /etc


Answer: -a also shows hidden files and directories. 

## Q9: What is the largest file in /var/log? What size is it?

Command:


$ ls -lh /var/log

Output:

-rw-r--r--  1 root              root            806K Sep  1 10:28 dpkg.log


Answer: The largest file was dpkg.log and it was 806K.

## Q10: What was modified most recently?

Command:


$ ls -lt /var/log


Output:


-rw-r--r--  1 root                                  root                                     8192 Sep 13 14:41 wtmp.db

-rw-rw----  1 root                                  utmp                                     9984 Sep 13 14:41 wtmp


Answer: wtmp.db and wtmp were modified most recently.



# Part 3 Creating and managing files

## Q11: Show the command (or commands) you used.

Command:


$ mkdir -p ~/cyber-course/{unit1,unit2,unit3/{osint,recon,crypto},scratch}


Then I created the files:


$ touch ~/cyber-course/scratch/a.txt

$ touch ~/cyber-course/scratch/b.txt

$ touch ~/cyber-course/scratch/c.txt


I copied and moved them:


$ cp ~/cyber-course/scratch/a.txt ~/cyber-course/unit1/intro.txt

$ mv ~/cyber-course/scratch/b.txt ~/cyber-course/unit2/

$ mv ~/cyber-course/scratch/c.txt ~/cyber-course/scratch/notes.txt



## Q12: What key combination did you use to save? What key combination did you use to exit?

Command:


$ nano ~/cyber-course/unit1/intro.txt


I entered:


This is my first file edited from the Linux command line.

Today I learned that mv is also rename, and that nano shows shortcuts at the bottom


Answer: I used Ctrl+O to save and Ctrl+X to exit. I also pressed Enter after Ctrl+O to confirm the filename.

I checked the file with:


$ cat ~/cyber-course/unit1/intro.txt


Output:


This is my first file edited from the Linux command line.

Today I learned that mv is also rename, and that nano shows shortcuts at the bottom


## Q13: Why did rmdir fail (or succeed)?

Command:


$ rmdir ~/cyber-course/scratch/


Output:


rmdir: failed to remove '/home/varia/cyber-course/scratch/': Directory not empty


Answer: rmdir failed because the directory was not empty. There were still files inside it.

I then removed it with:


$ rm -r ~/cyber-course/scratch/




# Part 4 Viewing files

## Q14: Which Debian version do you have?

Command:


$ cat /etc/os-release


Output:

PRETTY_NAME="Debian GNU/Linux 13 (trixie)"

NAME="Debian GNU/Linux"

VERSION_ID="13"

VERSION="13 (trixie)"

VERSION_CODENAME=trixie

DEBIAN_VERSION_FULL=13.6

ID=debian

HOME_URL="https://www.debian.org/"

SUPPORT_URL="https://www.debian.org/support"

BUG_REPORT_URL="https://bugs.debian.org/"



Answer: I have Debian GNU/Linux 13 (trixie), version 13.6.

## Q15: What kind of messages do you see? Are they recent?

The assignment command was:


$ sudo tail -n 10 /var/log/syslog




Answer: They were system and service messages. The timestamps showed that they were recent.



# Part 5 Searching

## Q16: How many lines were returned? (Hint: pipe to wc -l.)

Command:


$ grep "ssh" /etc/services


Output:


ssh		22/tcp				# SSH Remote Login Protocol


Then:


$ grep "ssh" /etc/services | wc -l


Output:


1


Answer: 1 line was returned.

## Q17: How would you modify the command to show only .conf files modified in the last 7 days?

Command:

$ find /etc -name "*.conf" -mtime -7


Output:

find: ‘/etc/ssl/private’: Permission denied

find: ‘/etc/credstore.encrypted’: Permission denied

find: ‘/etc/polkit-1/rules.d’: Permission denied

find: ‘/etc/credstore’: Permission denied

/etc/resolv.conf

find: ‘/etc/cups/ssl’: Permission denied

/etc/cups/subscriptions.conf



Answer: I added -mtime -7 to the command. This shows .conf files modified less than 7 days ago.

## Q18: Where are these commands actually located on the filesystem?

Commands:


$ which ls

$ which nano


Output:


/usr/bin/ls

/usr/bin/nano


Answer: ls is located at /usr/bin/ls and nano is located at /usr/bin/nano.



# Part 6 History, redirection, and pipes

## Q19: What does the | symbol do here?

Command:


$ history | tail -n 20


Output:


59  mv ~/cyber-course/scratch/c.txt ~/cyber-course/scratch/notes.txt

60  touch

61  ls -l

62  ls -l ~/cyber-course/scratch/

63  ls -l ~/cyber-course/unit1/

64  ls -l ~/cyber-course/unit2/

65  nano ~/cyber-course/unit1/intro.txt

66  cat ~/cyber-course/unit1/intro.txt

67  rmdir ~/cyber-course/scratch/

68  rm -r ~/cyber-course/scratch/

69  ls ~/cyber-course/

70  cat /etc/os-release

71  sudo tail -n 10 /var/log/syslog

72  sudo journalctl -n 10

73  grep "ssh" /etc/services

74  grep "ssh" /etc/services | wc -l

75  find /etc -name "*.conf" -mtime -7

76  which ls

77  which nano

78  history | tail -n 20



Answer: The | sends the output of one command to another command. Here, history sends its output to tail.

## Q20: What is the difference between > and >>?

Commands:


$ ls -la ~/cyber-course/ > ~/listing.txt

$ cat ~/listing.txt

$ date >> ~/listing.txt

$ cat ~/listing.txt


Output:


total 20

drwxrwxr-x  5 varia varia 4096 Sep 13 15:12 .

drwx------ 16 varia varia 4096 Sep 13 17:11 ..

drwxrwxr-x  2 varia varia 4096 Sep 13 15:07 unit1

drwxrwxr-x  2 varia varia 4096 Sep 13 15:04 unit2

drwxrwxr-x  5 varia varia 4096 Sep 13 14:59 unit3

Sun 13 Sep 17:11:39 EEST 2026


Answer: > writes to a file and overwrites the old contents. >> adds new output to the end of the file.

## Q21: What was the output, and why?

Command:


$ echo "hello cyber world" | grep "cyber"


Output:


hello cyber world


Answer: grep found the word cyber in the sentence, so it printed the line.



# Part 7 Archives

## Q22: Confirm with ls -la that the extraction worked. What did you find inside?

My first attempt was:

$ cd ~/cyber-course/

$ zip -r unit1.zip unit1/


Output:


  adding: home/varia/cyber-course/unit1/ (stored 0%)
  
  adding: home/varia/cyber-course/unit1/intro.txt (deflated 23%)


I checked the archive:


$ unzip -l ~/unit1.zip


Output:


 Archive:  /home/varia/unit1.zip

  Length                 Date                     Time                                 Name

        0                 2026-09-13              15:07                              home/varia/cyber-course/unit1/
        
      143                 2026-09-13              15:07                              home/varia/cyber-course/unit1/intro.txt
                  
      143                    2 files


Then I extracted it:


$ unzip ~/unit1.zip -d ~/unit1-extracted


The extracted location contained intro.txt inside the unit1 directory.

Answer: The extraction worked and I found intro.txt inside the unit1 directory.

## Q23: What do the flags c, z, v, and f each mean?

Command:

$ ~/cyber-course/unit2/
$ tar -czvf unit2.tar.gz unit2/


Output:


tar: Removing leading `/' from member names

/home/varia/cyber-course/unit2/

/home/varia/cyber-course/unit2/b.txt


I checked the archive with:


$ tar -tzvf unit2.tar.gz


Output:


drwxrwxr-x varia/varia       0 2026-09-13 15:04 home/varia/cyber-course/unit2/

-rw-rw-r-- varia/varia       0 2026-09-13 15:03 home/varia/cyber-course/unit2/b.txt


Answer:

c means create.

z means gzip compression.

v means verbose.

f means file.



# Part 8 Permissions

## Q24: Paste the permission string. Can the owner execute the file?

Commands:


$ touch ~/cyber-course/hello.sh

$ ls -l ~/cyber-course/hello.sh


Output:


-rw-rw-r-- 1 varia varia 0 Sep 13 17:21 /home/varia/cyber-course/hello.sh


Answer: The permission string is -rw-rw-r--. No, the owner cannot execute the file because there is no x permission.

## Q25: What happened, and why?

I added the script and tried to run it:


$ ~/cyber-course/hello.sh


Output:


bash: /home/varia/cyber-course/hello.sh: Permission denied


Answer: The script did not run because it did not have execute permission.

## Q26: What does the new permission string look like? Did the script run this time?

Commands:


$ chmod u+x ~/cyber-course/hello.sh

$ ls -l ~/cyber-course/hello.sh


Output:


-rwxrw-r-- 1 varia varia 47 Sep 13 17:22 /home/varia/cyber-course/hello.sh


Then I ran it again:


$ ~/cyber-course/hello.sh


Output:


Hello from my Linux script!


Answer: The new permission string was -rwxrw-r--. Yes, the script ran this time.

## Q27: What does 700 mean in plain language?

Command:

$ chmod 700 ~/cyber-course/hello.sh

$ ls -l ~/cyber-course/hello.sh


Output:


-rwx------ 1 varia varia 47 Sep 13 17:22 /home/varia/cyber-course/hello.sh


Answer: 700 means the owner can read, write and execute the file



# Part 9 Processes and system info

## Q28: What does the USER column show?

Command:


$ ps aux | head


Output:

```text
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root           1  0.0  0.7  23876 15060 ?        Ss   14:40   0:06 /sbin/init
root           2  0.0  0.0      0     0 ?        S    14:40   0:00 [kthreadd]
root           3  0.0  0.0      0     0 ?        I<   14:40   0:00 [pool_workqueue_release]
root           4  0.0  0.0      0     0 ?        I<   14:40   0:00 [kworker/R-kvfree_rcu_reclaim]
root           5  0.0  0.0      0     0 ?        I<   14:40   0:00 [kworker/R-rcu_gp]
root           6  0.0  0.0      0     0 ?        I<   14:40   0:00 [kworker/R-sync_wq]
root           7  0.0  0.0      0     0 ?        I<   14:40   0:00 [kworker/R-slub_flushwq]
root           8  0.0  0.0      0     0 ?        S    14:40   0:00 [kworker/R-netns]
root          11  0.0  0.0      0 ?        I<   14:40   0:00 [kworker/0:0H-events_highpri]
```

Answer: The USER column shows which user owns the process.

## Q29: How much disk space is your cyber-course directory using?

Commands:


$ df -h

$ du -sh ~/cyber-course

Output:


/dev/sda1        30G  5.8G   23G  21% /


and:


36K	/home/varia/cyber-course


Answer: The cyber-course directory was using 36K.

## Q30: How much RAM does your VM have, and how much is currently used?

Command:


$ free -h


Output:


                          
  total        /             used    /      free      /  shared      /  buff-cache        /    available
 
Mem:           1.9Gi       1.0Gi       214Mi       9.6Mi       872Mi       921Mi

Swap:          1.7Gi          0B       1.7Gi


Answer: The VM has 1.9GiB of RAM and about 1.0GiB is currently used.



# Part 10 Networking and downloads

## Q31: What is your VM's IP address on the primary interface?

Command:


$ ip a



Answer: The IPv4 address was 10.0.2.15/24.

## Q32: Did both succeed? If one failed, what is the most likely reason?

Commands:


$ ping -c 4 1.1.1.1

$ ping -c 4 example.com


Output for 1.1.1.1:


4 packets transmitted, 4 received, 0% packet loss, time 3008ms

rtt min/avg/max/mdev = 20.173/27.050/40.847/8.217 ms

Output for example.com:


4 packets transmitted, 4 received, 0% packet loss, time 3005ms

rtt min/avg/max/mdev = 26.183/28.718/33.601/2.876 ms


Answer: Both succeeded. Both received 4 packets and had 0% packet loss.


## Q33: Are the two files identical? (Hint: diff debian.html debian2.html.

Commands: 

$ curl https://www.debian.org/ > debian-curl.html


Output:


100 15862  100 15862    0     0  39651      0 --:--:-- --:--:-- --:--:-- 39854


Then:


$ diff index.html debian-curl.html


There was no output.


Answer: Yes. There were no differences between the two files.



# Part 11 Package management and sudo

## Q34: Did sudo ask for a password? Whose password?

Command:


$ sudo apt update


Output:

[sudo] password for varia:

88 packages can be upgraded.


Answer: Yes. It asked for the password of the current user, varia.

## Q35: Were any packages upgraded? Roughly how many?

Commands:


$ apt list --upgradable

$ sudo apt upgrade


Output:


Upgrading: 88, Installing: 0, Removing: 0, Not Upgrading: 0


Answer: Yes. 88 packages were upgraded.

## Q36: What's one thing htop shows you that top did not?

Commands:


$ sudo apt install htop

$ which htop


Output:


/usr/bin/htop


I also checked the package:


$ apt show htop

output:


Package: htop

Version: 3.4.1-5

Description: interactive processes viewer


I ran htop and quit with q.

Answer: I could scroll through the process list and see full command lines more easily.

## Q37: What is nmap, according to the description?

Command:


$ apt search nmap


Output:


nmap/stable 7.95+dfsg-3 amd64

  The Network Mapper


Answer: According to the description, nmap is The Network Mapper.



# Part 12 Putting it together

## Q38: Paste the commands you used. The output redirection (> and >>) is the key here.

I created the directory:


$ mkdir -p ~/cyber-course/report


Then I created system-info.txt:


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


I checked the file:


$ cat ~/cyber-course/report/system-info.txt


Then I created the ZIP:


$ zip -r ~/report.zip ~/cyber-course/report/


Output:


adding: home/varia/cyber-course/report/ (stored 0%)

adding: home/varia/cyber-course/report/system-info.txt (deflated 46%)


Finally:


$ unzip -l ~/report.zip


Output:

```text
Archive:  /home/varia/report.zip
  Length      Date    Time    Name
---------  ---------- -----   ----
        0  2026-09-13 17:42   home/varia/cyber-course/report/
      648  2026-09-13 17:42   home/varia/cyber-course/report/system-info.txt
---------                     -------
      648                     2 files
```



# Reflection

To be honest, there wasn’t a command that really surprised me, maybe the ones used to create files. The command I think I’ll use most often is ls, because I always need it when I want to check files, directories, or permissions. One of the topics that’s still a bit confusing in the Linux command line is permissions. At first, it was hard to read strings like -rwx------. That difficulty persists; it’s still very hard to read.
