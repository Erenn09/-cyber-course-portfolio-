# WannaCry


WannaCry was a major ransomware attack that emerged in May 2017. Within a few hours, it affected more than 230,000 computers across over 150 countries. A wide range of organizations from small businesses to large corporations, and from banks to railways and hospitals were affected by the attack.

The attack severely affected healthcare organizations such as the NHS in the UK and caused disruptions to some services. Banks, companies, railways, and government agencies also experienced problems accessing their systems.

In my opinion, the aspect of the CIA Triad most directly affected was Availability. This is because WannaCry encrypted files, preventing people from accessing their systems and files.

Ransomware is a type of malware that encrypts files on a computer and demands payment to restore access. What made WannaCry particularly dangerous was its ability to spread automatically to other computer like a worm by exploiting the EternalBlue vulnerability. In typical ransomware attacks, the user usually has to open a malicious file or click a link, but WannaCry did not require this to spread.

During the attack, a lot of computers were locked at the same time and files were encrypted, showing it was a big attack. Security researcher Marcus Hutchins noticed that WannaCry was trying to connect to a specific domain and bought that domain. Once the domain went live, WannaCry shut itself down, and thanks to this kill switch, the spread of the attack slowed down a lot.

Microsoft had released the MS17-010 patch that closed the vulnerability exploited by WannaCry about two months before the attack. However, some organizations didn't apply the patch because they were using old systems, hadn't updated, or were worried that updates might break their systems or cause compatibility issues. If the patch couldn't be applied, at least separating networks from each other and keeping backups of important files could have reduced the damage.

I think the most important lesson here is that delaying updates is a serious security risk. Especially in critical places like hospitals, old and unpatched systems can cause huge problems.

I used to see Windows updates more as new features and minor fixes. After WannaCry, I realized why security updates need to be done on time.
