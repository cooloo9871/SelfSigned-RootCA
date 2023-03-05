#!/bin/bash

domain=$2
ip=$3

help()
{
  cat <<EOF
Usage: mk [OPTIONS]

Available options:

create    create [domain] [IP]
delete    delete cert
test      test
EOF
  exit
}

ssl()
{
openssl genrsa -aes256 -passout pass:password -out ca-key.pem 4096

openssl req -new -x509 -sha256 -days 365 -subj "/C=TW/ST=Taipei/L=Taipei/O=test/OU=lab/CN=example" -passin pass:password -key ca-key.pem -out ca.pem

openssl genrsa -out cert-key.pem 4096

openssl req -new -sha256 -subj "/CN=example" -key cert-key.pem -out cert.csr

echo -e "subjectAltName=DNS:${domain},IP:${ip}\nextendedKeyUsage = serverAuth" > extfile.cnf

openssl x509 -req -sha256 -days 365 -passin pass:password -in cert.csr -CA ca.pem -CAkey ca-key.pem -out cert.pem -extfile extfile.cnf -CAcreateserial
}

de()
{
rm ca-key.pem ca.pem ca.srl cert.csr cert-key.pem cert.pem extfile.cnf &>/dev/null
if [ "$?" == "0" ];then
  echo "delete all cert ok!"
else
  echo "delete cert fail,please check!"
fi
}

ts()
{
openssl verify -CAfile ca.pem -verbose cert.pem
}


case $1 in
  create)
    if [ "$#" == "3" ];then
      ssl
    else
      help
    fi
  ;;
  delete)
    de
  ;;
  test)
    ts
  ;;
  *)
    help
  ;;
esac
