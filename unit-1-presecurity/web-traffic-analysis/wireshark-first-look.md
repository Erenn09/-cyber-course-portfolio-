### PART A
#### 1. Find the login submission. What username and password were sent? Paste the line from the stream where you found them.
- username=anna.virtanen&password=Summer2026
#### 2. The login form was submitted using which HTTP method — GET or POST? (Look at the packet that carries the credentials.)
- GET /login HTTP/1.1
#### 3. After a successful login, the server sends back a Set-Cookie header. What is the value of the SESSIONID cookie? Why might an attacker who sees this cookie be dangerous, even without the password?
- SESSIONID=a3f9c2e7b81d4f60a5e2c9d10f4b7e88
- Because the cookie may contain a session identifier.
#### 4. The dashboard page (the final server response) reveals personal details about the user. List two pieces of sensitive information visible there.
- Host: lab-portal.local  User-Agent: Mozilla/5.0

### PART B 
#### 5. Apply the filter tls. Can you find the username and password anywhere in this capture? Why or why not?
- No, I cannot find the username and password because TLS encrypts the data sent between the client and the server.
#### 6. Look at the first TLS packet (the "Client Hello"). One piece of plaintext is still visible here: the name of the server the client is connecting to. What is it? 
- Pohjola Logistics Lab1.0
#### 7. Even though the contents are encrypted, name one thing an eavesdropper can still learn from the HTTPS capture.
- The eavesdropper can still see the source and destination IP addresses.

### PART C 
#### 8. In one sentence: why does the protocol choice (HTTP vs HTTPS) matter for confidentiality?
- HTTP sends data without encryption, HTTPS encrypts data using TLS.
#### 9. Name one situation in your daily life where you might be sending traffic over an untrusted network (e.g. public Wi-Fi). What protects you, and what would still be exposed?
- For example, when using public Wi-Fi in the shopping mall, connecting to the internet may mean sending traffic over an untrusted network.
- HTTPS/TLS protects by encrypting it, but my IP address, my destination server, connection timing may still be exposed.

