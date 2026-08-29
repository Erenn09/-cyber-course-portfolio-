# Subnetting Basics Assignment (U1-03f)

Name: Eren



## Task 1 - Binary ↔ decimal for a single octet

### Show work (3 examples):
1. Decimal 210 -> binary:
   128 + 64 + 0 + 16 + 0 + 0 + 2 + 0 = 210
   Binary: 11010010

2. Decimal 168 -> binary:
   128 + 32 + 8 = 168
   Binary: 10101000

3. Binary 11010010 -> decimal:
   128 + 64 + 16 + 2 = 210



### 1.1 - Decimal to binary

| Decimal | Binary |
| --- | --- |
| 10 | 00001010 |
| 210 | 11010010 |
| 168 | 10101000 |
| 16 | 00010000 |
| 255 | 11111111 |
| 128 | 10000000 |
| 192 | 11000000 |
| 248 | 11111000 |
| 0 | 00000000 |



### 1.2 - Binary to decimal

| Binary | Decimal |
| --- | --- |
| 11000000 | 192 |
| 11111111 | 255 |
| 10101000 | 168 |
| 00010000 | 16 |
| 11111000 | 248 |
| 11010010 | 210 |



### 1.3 - Full-address conversion

* 10.210.168.16 -> 00001010.11010010.10101000.00010000
* 192.168.0.1 -> 11000000.10101000.00000000.00000001
* 172.16.5.100 -> 10101100.00010000.00000101.01100100

Reverse:
* 11000000.10101000.00000001.00000001 -> 192.168.1.1
* 00001010.00001010.00000000.01001011 -> 10.10.0.75



## Task 2 - Recognize the class and CIDR

### 2.1 - What class is it?

| Address | Class | Default mask (dotted) | Default mask (CIDR) |
| --- | --- | --- | --- |
| 10.0.0.5 | A | 255.0.0.0 | /8 |
| 192.168.1.1 | C | 255.255.255.0 | /24 |
| 172.16.4.20 | B | 255.255.0.0 | /16 |
| 8.8.8.8 | A | 255.0.0.0 | /8 |
| 200.100.50.25 | C | 255.255.255.0 | /24 |



### 2.2 - Mask ↔ CIDR ↔ binary

| Dotted-decimal | CIDR | Binary (32 bits, dots between octets) |
| --- | --- | --- |
| 255.255.255.0 | /24 | 11111111.11111111.11111111.00000000 |
| 255.255.0.0 | /16 | 11111111.11111111.00000000.00000000 |
| 255.0.0.0 | /8 | 11111111.00000000.00000000.00000000 |
| 255.255.255.192 | /26 | 11111111.11111111.11111111.11000000 |
| 255.255.248.0 | /21 | 11111111.11111111.11111000.00000000 |
| 255.255.255.128 | /25 | 11111111.11111111.11111111.10000000 |

---

### 2.3 - Networks and hosts per class

| Class | Default CIDR | Number of possible networks | Number of hosts per network |
| --- | --- | --- | --- |
| A | /8 | 128 nets | 16 million hosts |
| B | /16 | 16384 nets | 65534 hosts |
| C | /24 | 2097152 nets | 254 hosts |



## Task 3 - The five key values - the main event

### 3.1 - 172.16.0.0/16
subnet mask:       255.255.0.0  
network address:   172.16.0.0  
default gateway:   172.16.0.1  
host range start:  172.16.0.2  
host range end:    172.16.255.254  
broadcast:         172.16.255.255  

### 3.2 - 10.10.0.0/26
subnet mask:       255.255.255.192  
network address:   10.10.0.0  
default gateway:   10.10.0.1  
host range start:  10.10.0.2  
host range end:    10.10.0.62  
broadcast:         10.10.0.63  

### 3.3 - 192.168.5.0/28
subnet mask:       255.255.255.240  
network address:   192.168.5.0  
default gateway:   192.168.5.1  
host range start:  192.168.5.2  
host range end:    192.168.5.14  
broadcast:         192.168.5.15  

### 3.4 - 10.0.0.0/30
subnet mask:       255.255.255.252  
network address:   10.0.0.0  
default gateway:   10.0.0.1  
host range start:  10.0.0.2  
host range end:    10.0.0.2  
broadcast:         10.0.0.3  

### 3.5 - 192.168.100.128/25
subnet mask:       255.255.255.128  
network address:   192.168.100.128  
default gateway:   192.168.100.129  
host range start:  192.168.100.130  
host range end:    192.168.100.254  
broadcast:         192.168.100.255  



## Task 4 - Which subnet does this host belong to?

### 4.1 - 10.10.0.75/26
- Network address: 10.10.0.64
- Broadcast: 10.10.0.127
- Valid host: Yes, because block size is 64 so subnets are .0-.63 and .64-.127. 75 is in the middle of usable host range (.65 to .126).

### 4.2 - 192.168.1.200/26
- Network address: 192.168.1.192
- Broadcast: 192.168.1.255
- Valid host: Yes, block size is 64 and this range goes from .192 to .255. .200 is usable.

### 4.3 - 172.16.5.130/25
- Network address: 172.16.5.128
- Broadcast: 172.16.5.255
- Valid host: Yes, /25 gives 128 hosts per block (.0-.127 and .128-.255). .130 is inside .128 network.

### 4.4 - 10.0.0.0/30
- Network address: 10.0.0.0
- Broadcast: 10.0.0.3
- Valid host: No, because .0 is the network address itself, not a host address.



## Task 5 - Slicing up a /24

### 5.1 - Four equal /26 subnets

Subnet 1:
- Network address: 192.168.10.0
- Default gateway: 192.168.10.1
- Host range: 192.168.10.2 - 192.168.10.62
- Broadcast: 192.168.10.63

Subnet 2:
- Network address: 192.168.10.64
- Default gateway: 192.168.10.65
- Host range: 192.168.10.66 - 192.168.10.126
- Broadcast: 192.168.10.127

Subnet 3:
- Network address: 192.168.10.128
- Default gateway: 192.168.10.129
- Host range: 192.168.10.130 - 192.168.10.190
- Broadcast: 192.168.10.191

Subnet 4:
- Network address: 192.168.10.192
- Default gateway: 192.168.10.193
- Host range: 192.168.10.194 - 192.168.10.254
- Broadcast: 192.168.10.255



### 5.2 - Enough hosts?

Table fill:
- /26 -> 64 total, 62 usable
- /27 -> 32 total, 30 usable
- /28 -> 16 total, 14 usable
- /29 -> 8 total, 6 usable
- /30 -> 4 total, 2 usable

Questions:
- Would /26 fit all? Yes, because Dept A needs 50 and /26 gives 62 hosts, which is enough for all of them.
- Too much space? Dept B, C and D don't need /26, it wastes a lot of IP addresses.
- Suggested CIDRs:
  - Dept A (50 hosts): /26 (needs at least 50 hosts)
  - Dept B (25 hosts): /27 (gives 30 hosts)
  - Dept C (10 hosts): /28 (gives 14 hosts)
  - Dept D (2 hosts): /30 (point-to-point link, 2 hosts)



## Task 6 - IPv6, briefly

### 6.1 - Hex ↔ decimal ↔ binary refresher

| Hex | Decimal | Binary (4 bits) |
| --- | --- | --- |
| 0 | 0 | 0000 |
| 5 | 5 | 0101 |
| a | 10 | 1010 |
| f | 15 | 1111 |



### 6.2 - Compress IPv6

1. 2001:0df8:23f2:0000:0000:0000:0000:0f11 -> 2001:df8:23f2::f11
2. 2001:0000:00d0:00f2:0000:0000:0000:0f11 -> 2001:0:d0:f2::f11
3. fe80:0000:0000:0000:0000:0000:0000:0001 -> fe80::1



### 6.3 - Conceptual question

We need IPv6 because IPv4 only has around 4.3 billion addresses and we ran out of them with so many phones and devices on the internet. IPv6 uses 128-bit addresses so it gives way more IPs and we won't need hacks like NAT to save addresses.
