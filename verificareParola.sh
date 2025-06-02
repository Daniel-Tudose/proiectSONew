#!/bin/bash

if [ ! ${#1} -ge 12 ]; then
  echo "Parola are mai PUTIN de 12 caractere!"
  exit 1
fi

if [[ ! "$1" =~ [a-z] ]]; then
  echo "Parola TREBUIE sa contina cel putin o litera mica!"
  exit 1
fi

if [[ ! "$1" =~ [A-Z] ]]; then
  echo "Parola TREBUIE sa contina cel putin o litera mare!"
  exit 1
fi

if [[ ! "$1" =~ [0-9] ]]; then
  echo "Parola TREBUIE sa contina cel putin o cifra!"
  exit 1
fi

./caractereSpeciale.sh "$1"

if [[ ! "$?" = 0 ]]; then
  echo "Parola TREBUIE sa contina caractere SPECIALE!"
  exit 1
fi

exit 0
