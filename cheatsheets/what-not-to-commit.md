Never commit:

Passwords, API keys, tokens, or other credentials — even temporarily, even "just for testing"
Personal data of other people (names, emails, photos with faces) — including your classmates
Real-world targets (IP addresses, hostnames, employee info) from environments you don't own
Screenshots that contain credentials, session tokens, or personal information
Anything from the OSINT investigations on the fictional persona that could be used to identify a real person

Be careful with:

Lab VM IP addresses (acceptable if they're RFC1918 private addresses on your own network)
Tool outputs that include your username, hostname, or paths revealing where you live or work
Wireshark captures (.pcap files) — these often contain more than people realize
Your full MAC address and full public IP on devices you own — mask the last group if your repo is public

If you accidentally commit a secret:

Treat the secret as compromised. Rotate/revoke it immediately.
Deleting it from the next commit is not enough — the secret stays in the Git history.
Tell the instructor and remove the secret from history (git filter-repo or BFG Repo-Cleaner). The instructor can help.
