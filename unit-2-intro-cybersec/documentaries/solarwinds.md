# The SolarWinds Hack

The attackers first infiltrated SolarWinds' systems. They then inserted malicious code into the standard update process for SolarWinds' network management software, Orion. Consequently, customers installed the update, believing it to be legitimate SolarWinds software, thereby opening a gateway for the attackers to access their systems.

Approximately 18,000 organizations downloaded the malicious Orion update; however, not all of them were actively targeted by the attackers in the second stage. U.S. government agencies and major technology companies were subjected to more sophisticated targeting activities. The attackers gathered information and engaged in espionage.

Confidentiality is the principle most directly affected here. Because the attackers' goal was not to shut down systems, but to infiltrate networks and obtain emails and other sensitive information. Integrity was also affected because SolarWinds' genuine software update was modified and malicious code was inserted into it.

A supply chain attack refers to a cyberattack carried out against companies by exploiting vulnerabilities in hardware and software products obtained from third parties. Normally, an attacker directly targets an organization. In this case, the trusted supplier SolarWinds was targeted, and customers using its software were reached. 

FireEye was the first to detect the attack. Using stolen employee credentials, the hackers registered their own devices to FireEye’s multi-factor authentication system. FireEye grew suspicious when the system sent an alert to the employee, and the investigation was subsequently expanded in collaboration with SolarWinds and the U.S. government.

Better monitoring and MFA could have made it harder for attackers to move through the system and access sensitive information after breaking in. Also, not automatically assuming even a trusted software update is completely safe would have been an important defense.

The fact that a piece of software was produced by a reputable company does not mean it is always secure. The SolarWinds incident clearly demonstrated that the supply chain is also part of the attack surface.

I used to consider an official software update to be quite safe. After this incident, however, I believe that the update itself could have been compromised, and that additional security checks are therefore necessary.
