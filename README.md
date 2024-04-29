# This script is used to create Private CA Signed Certificate

```
git clone https://github.com/cooloo9871/SelfSigned-RootCA.git;cd SelfSigned-RootCA
```
## Script usage
```
./mk --help
Usage: mk [OPTIONS]

Available options:

create    create [domain] [IP]
delete    delete cert
test      test
```

## Example
1. test.example.com is the domain to register.
2. 192.168.11.90 is the ip that the domain test.example.com resolves to.
```
$ ./mk create test.example.com 192.168.11.90
```
