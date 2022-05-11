# DNS setting

1. A mail {IP}
2. MX @ mail.{DOMAIN}
3. TXT @ v=spf1 mx ?all
4. TXT mail._domainkey v=DKIM1; h=sha256; k=rsa; p={KEY}
5. TXT _dmarc v=DMARC1; p=none; sp=quarantine; rua=mailto:mailauth-reports@{DOMAIN}

Be sure to check IPs for blacklists and Spamhaus
