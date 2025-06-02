#!/bin/bash

if [[ ! "$1" =~ ^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
  echo "Adresa de email NU este valida!"
  exit 1
fi

exit 0
