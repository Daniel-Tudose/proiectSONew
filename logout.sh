#!/bin/bash

if [ ${#loggedInUsers[@]} -eq 0 ]; then
  echo "Nu exista utilizatori autentificati in acest moment."
  exit 1
fi

username="${loggedInUsers[-1]}"

nouaLista=()
for user in "${loggedInUsers[@]}"; do
  if [ "$user" != "$username" ]; then
    nouaLista+=("$user")
  fi
done

loggedInUsers=("${nouaLista[@]}")

echo "Utilizatorul '$username' a fost delogat cu succes."
