# This script is used to create Private CA Signed Certificate

```
wget https://raw.githubusercontent.com/cooloo9871/SelfSigned-RootCA/refs/heads/master/mk
```
## Script usage
```
./mk --help
Usage: mk [OPTIONS]

Available options:

create    create [domain] [IP]
delete    delete all cert.
test      verify the signature and validity of digital certificate.
expiry    check the expiration time of certificate.
```

## Example
1. test.example.com is the domain to register.
2. 192.168.11.90 is the ip that the domain test.example.com resolves to.
```
$ ./mk create test.example.com 192.168.11.90
```
