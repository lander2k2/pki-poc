#!/bin/bash

USER_EMAIL="$1"

KEY_MODULUS=$(openssl rsa -in $USER_EMAIL.key -noout -modulus | openssl md5)
CRT_MODULUS=$(openssl x509 -in $USER_EMAIL.crt -noout -modulus | openssl md5)

if [ "$KEY_MODULUS" = "$CRT_MODULUS" ]; then
    echo "The client certificate and private key are a valid pair."
else
    echo "The client certificate and private key are NOT a valid pair."
fi

