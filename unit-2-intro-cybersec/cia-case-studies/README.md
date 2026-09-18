# CIA Triad Case Studies

## Scenario A – Hospital

**1. Primary CIA violation:**
**Availability**

**2. Secondary impact – Confidentiality:**
The attackers stole some patient files and threatened to publish them. This means that sensitive patient information got into the hands of unauthorized people.

**3. Attack technique:**
The main attack was a **ransomware** attack. The attackers also used **data exfiltration** because they took some patient files outside the hospital.

**4. Preventive controls:**

* Make regular offline or immutable backups of important patient data.
* Keep operating systems and security software up to date.

**5. Damage-limitation controls:**

* Disconnect infected computers and servers from the network.
* Restore important systems from clean backups.
* Use an incident response plan to keep critical hospital services running during recovery.

---

## Scenario B – Leaked Database

**1. Primary CIA violation:**
**Confidentiality**

**2. Secondary impact – Integrity:**
Since the attacker was able to access the customer database, the company should check whether any information was changed without permission.

**3. Attack technique:**
The main technique was **data exfiltration** or a **database breach**. The attacker accessed the customer database and copied the information outside the company’s systems.

**4. Preventive controls:**

* Use strong access controls so that only authorized users and applications can access the database.
* Use multi-factor authentication (MFA) for administrator accounts.
* Monitor unusual database activity and large amounts of data being downloaded.

**5. Damage-limitation controls:**

* Immediately disable compromised accounts and change their passwords.
* Check which information was stolen and which accounts were affected by the incident.

---

## Scenario C – Defaced Municipal Website

**1. Primary CIA violation:**
**Integrity**

**2. Secondary impact – Availability:**
The website was offline for four hours while staff restored it. During this time, local residents could not use the municipality’s website.

**3. Attack technique:**
The most likely technique was **website defacement through a web vulnerability**. The attacker gained access to the website and replaced the homepage with their own political message.

**4. Preventive controls:**

* Regularly update and patch the website.
* Use strong administrator passwords and MFA.
* Limit administrator access and use a web application firewall.

**5. Damage-limitation controls:**

* Restore the website from a clean backup.
* Temporarily take the affected website or server offline until the attack is stopped.
* Check server logs and remove the attacker’s access before bringing the website fully back online.

---

## Scenario D – Manipulated Invoice

**1. Primary CIA violation:**
**Integrity**

**2. Secondary impact – Confidentiality:**
Since the supplier’s email account was compromised, the attacker was able to access emails and other information in the account. This information may have helped the attacker understand the supplier’s business communications.

**3. Attack technique:**
The most likely technique was **Business Email Compromise (BEC)** using a **compromised email account**. The attacker changed the bank account details on the invoice and caused the company to send €18,000 to the wrong account.

**4. Preventive controls:**

* Use multi-factor authentication (MFA) on email accounts.
* Verify bank account changes using another communication method, such as calling the supplier by phone.
* Use email security tools and alerts to detect suspicious logins.

**5. Damage-limitation controls:**

* Immediately contact the bank to try to stop or recover the €18,000 payment.
* Disable the compromised email account and change its password.
* Check the account for other fraudulent emails and inform affected suppliers or customers.

---

## Conclusion

These four scenarios show how cyber attacks can affect different parts of the CIA triad. In the hospital incident, **availability** was mainly affected; in the leaked database, **confidentiality** was mainly affected; and in the website and invoice incidents, **integrity** was mainly affected.

