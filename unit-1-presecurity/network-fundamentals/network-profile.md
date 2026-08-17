# Network Profile — [EREN]

## Identity
- IPv4 address: 192.168.x6.x
- Subnet mask / CIDR:  255.255.255.0
- MAC address: 0x-a0-b7-y0-u0-xE
- Network address: 192.168.x6.0
- Broadcast address: 192.168.x6.255

### Q2: Your IP address is a private address (it starts with 192.168, 10., or 172.16–172.31). In one sentence, what is the difference between a private IP address and a public one? Why does your home router use private addresses inside your network?

- A private IP address identifies devices within your local network, while a public IP address identifies your network on the internet, so your router uses private addresses to manage devices internally and share one public IP for internet access.
### Q3: What is the difference between your IP address and your MAC address? Which one can change, and which one is (mostly) fixed to your hardware? Which one operates at which OSI layer?
- An IP address can change and works at OSI Layer 3 (Network), while a MAC address is usually fixed to the network hardware and works at OSI Layer 2 (Data Link)

### Q4: Your subnet mask is most likely 255.255.255.0, which is written as /24 in CIDR notation.

#### How many total addresses does a /24 contain?
- Total addresses: 256
#### How many of those are usable for devices (after subtracting the network and broadcast addresses)?
- Usable addresses: 254
- 256 − 2 (network + broadcast)
#### If your IP is 192.168.1.37/24, what is the network address and what is the broadcast address?
- Network address: 192.168.1.0
- Broadcast address: 192.168.1.255

## Gateway and reachability
- Default gateway: 192.168.1.1
- Ping to gateway (avg): 8 ms
- Ping to 1.1.1.1 (avg): 17 ms

### Q5: What is your default gateway's IP address? Is it on the same subnet as your machine?
- My default gateway is 192.168.1.1.

### Q6: What was the average round-trip time to your gateway versus to 1.1.1.1? Why is one much faster than the other?
- While the round-trip time to my network gateway was approximately 8 ms, the round-trip time to the 1.1.1.1 address was approximately 17 ms. The network gateway is much faster because it is located on my local network; 1.1.1.1, on the other hand, is a remote server on the Internet.

### Q7: Now try ping -c 4 example.com (or -n 4 on Windows). It worked using a name instead of an IP address. What service made that possible?
- DNS made this possible. It translates domain names like example.com into IP addresses that computers can communicate with.

## DNS
- Configured DNS server(s): 62.241.198.245 - 62.241.198.246
- example.com resolves to:  172.66.147.243 - 104.20.23.154

### Q9: What IP address(es) did example.com resolve to? Run the lookup for two more sites you use. Do any of them return multiple IP addresses? Why might a large website have more than one?
-  google.com resolves to:   173.194.221.101 - 173.194.221.138 - 173.194.221.139 - 173.194.221.113 - 173.194.221.102 - 173.194.221.100
-  youtube.com resolves to:  173.194.222.93 - 173.194.222.91 - 173.194.222.136 - 173.194.222.190
-  Large websites use multiple servers/IP addresses for load balancing, redundancy, and handling traffic from different geographic locations.

### Q10:  A security thought: DNS lookups are usually sent in cleartext. If someone could watch your network traffic, what could they learn about you just from your DNS queries — even if all the websites you visit use HTTPS?
- Someone monitoring my network could see which domain names I am querying. This could reveal the websites or online services I use and give them an idea of my interests or activities, even though the actual HTTPS traffic and page contents are encrypted.
  
## Path to the internet
- Hops to example.com: 9
- First hop: 2001-14ba-5e15-1b00-f281-75ff-fe34-1c4f.rev.dnainternet.fi

### Q12:  Some hops show * * * with no response. Does that mean the connection is broken? Explain what's most likely happening.
- No. * * * does not necessarily mean the connection is broken. It usually means that the router did not respond to the traceroute probe, possibly because ICMP traffic is filtered or the router is configured not to respond. The traffic can still continue through the router.


## Listening ports
| Port | Protocol | Interface (localhost / all) | Common use |
|------|----------|------------------------------|------------|
| 135  | TCP      | ALL                          | Windows RPC |
| 445  | TCP      | ALL                          | SMB       |
| 4343 | TCP      | ALL                          | Application-specific        |
| 4449 | TCP      | ALL                          | Application-specific        |
| 5040 | TCP      | ALL                          | Application-specific        |
| 5141 | TCP      | ALL                          | Application-specific        |
| 6742 | TCP      | ALL                          | Application-specific        |
| 7680 | TCP      | ALL                          | Application-specific        |

### Q14: Look up what two of these ports are commonly used for (a quick web search for "port 22" or "port 445" is fine). Why does it matter, from a security standpoint, whether a port is listening on localhost only versus on all interfaces?
- Port 135: Used by Windows for DCOM and core system services.
- Port 445: It allows computers to share resources such as files, folders, and printers over a network.

### Q15: A security thought: an attacker scanning your machine sees only the ports listening on 0.0.0.0 (network-facing), not the localhost-only ones. Based on your output, is your machine exposing more or fewer network-facing services than you expected
- A security thought: an attacker scanning your machine sees only the ports listening on 0.0.0.0 (network-facing), not the localhost-only ones. Based on your output, is your machine exposing more or fewer network-facing services than you expected
## Reflection (150–200 words)
### What surprised you about your own network?
- I was surprised to see so many listening ports on my computer. 
### Which open port (if any) would you want to investigate or close?
- I would investigate port 445 because it is used for SMB file sharing and can be a security risk if it is exposed unnecessarily. I would check which devices need it and close it if it is not needed.
### Which command do you think you'll use most often, and why?
- I think I will use nslookup most often because it is simple and useful for checking DNS information and understanding how domain names are resolved to IP addresses.
 
