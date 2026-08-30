# Task 1 - Binary ↔ decimal for a single octet

### 3 examples:
1. 210 to binary: 128 + 64 + 16 + 2 = 210 -> 11010010
2. 168 to binary: 128 + 32 + 8 = 168 -> 10101000
3. 11010010 to decimal: 128 + 64 + 16 + 2 = 210



### 1.1 - Decimal to binary

* 10 -> 00001010
* 210 -> 11010010
* 168 -> 10101000
* 16 -> 00010000
* 255 -> 11111111
* 128 -> 10000000
* 192 -> 11000000
* 248 -> 11111000
* 0 -> 00000000



### 1.2 - Binary to decimal

* 11000000 -> 192
* 11111111 -> 255
* 10101000 -> 168
* 00010000 -> 16
* 11111000 -> 248
* 11010010 -> 210



### 1.3 - Full-address conversion

Write IPv4 addresses in binary:
* 10.210.168.16 -> 00001010.11010010.10101000.00010000
* 192.168.0.1 -> 11000000.10101000.00000000.00000001
* 172.16.5.100 -> 10101100.00010000.00000101.01100100

Binary IPs in dotted-decimal:
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
- **Network address of this subnet:** 10.10.0.64
- **Broadcast of this subnet:** 10.10.0.127
- **Is this address a valid host address, or is it the network/broadcast?:** Yes, valid host.
- **Reason:** /26 means block size is 64. Subnets go by 64s (.0, .64, .128...). .75 is between network (.64) and broadcast (.127), so it's a host.



### 4.2 - 192.168.1.200/26
- **Network address:** 192.168.1.192
- **Broadcast:** 192.168.1.255
- **Valid host?:** Yes
- **Reason:** Block size is 64 again. The last subnet starts at .192 and ends at .255. .200 is inside the usable host range.



### 4.3 - 172.16.5.130/25
- **Network address:** 172.16.5.128
- **Broadcast:** 172.16.5.255
- **Valid host?:** Yes
- **Reason:** /25 splits the /24 in half (block size 128). First half is .0-.127, second is .128-.255. .130 is a usable IP in the second half.



### 4.4 - 10.0.0.0/30
- **Network address:** 10.0.0.0
- **Broadcast:** 10.0.0.3
- **Valid host?:** No
- **Reason:** Because .0 is the network IP itself, not a usable host IP.

## Task 5 - Slicing up a /24

### 5.1 - Four equal /26 subnets

Subnet 1:
- Network address: 192.168.10.0
- Default gateway: 192.168.10.1
- Host range: 192.168.10.2 - 192.168.10.62
- Broadcast address: 192.168.10.63

Subnet 2:
- Network address: 192.168.10.64
- Default gateway: 192.168.10.65
- Host range: 192.168.10.66 - 192.168.10.126
- Broadcast address: 192.168.10.127

Subnet 3:
- Network address: 192.168.10.128
- Default gateway: 192.168.10.129
- Host range: 192.168.10.130 - 192.168.10.190
- Broadcast address: 192.168.10.191

Subnet 4:
- Network address: 192.168.10.192
- Default gateway: 192.168.10.193
- Host range: 192.168.10.194 - 192.168.10.254
- Broadcast address: 192.168.10.255

---

### 5.2 - Enough hosts?

 CIDR - Total addresses - Usable hosts (total − 2) 

 /24   -    256       -         254 
 
 /25   -    128       -         126 
 
 /26   -    64        -         62 
 
 /27   -    32        -         30 
 
 /28   -    16        -        14
 
 /29   -    8         -         6 
 
 /30   -    4         -         2 

* Would /26 fit all 4 departments?
Yes, it fits all of them because the largest department (Dept A) needs 50 hosts and /26 gives 62 usable IPs.

* Which departments have too much space?
Dept B, Dept C, and Dept D have too much space in a /26. It wastes a lot of IP addresses.

* Better CIDR suggestions:
- Dept A (50 hosts): /26 (needs 62 usable hosts)
- Dept B (25 hosts): /27 (gives 30 usable hosts)
- Dept C (10 hosts): /28 (gives 14 usable hosts)
- Dept D (2 hosts): /30 (gives 2 usable hosts)

## Task 6 - IPv6, briefly

### 6.1 - Hex ↔ decimal ↔ binary refresher


| Hex | Decimal | Binary (4 bits) |
| --- | --- | --- |
| 0 | 0 | 0000 |
| 5 | 5 | 0101 |
| a | 10 | 1010 |
| f | 15 | 1111 |



### 6.2 - Compress these IPv6 addresses

- 2001:0df8:23f2:0000:0000:0000:0000:0f11 -> **2001:df8:23f2::f11**
- 2001:0000:00d0:00f2:0000:0000:0000:0f11 -> **2001:0:d0:f2::f11**
- fe80:0000:0000:0000:0000:0000:0000:0001 -> **fe80::1**



### 6.3 - A conceptual question

We need IPv6 because IPv4 only gives us about 4.3 billion addresses, and we basically ran out of them with all the phones, computers, and smart devices today. IPv6 uses 128-bit addresses so it gives us way more IP addresses. This means we won't need workarounds like NAT all the time just to connect new devices.
