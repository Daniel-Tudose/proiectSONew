#!/bin/bash

# Verificăm dacă există utilizatori autentificați
if [ ${#loggedInUsers[@]} -eq 0 ]; then
  echo "Nu există utilizatori autentificați în acest moment."
  exit 1
fi

# Preluăm ultimul utilizator autentificat
username="${loggedInUsers[-1]}"

# Creăm un array nou fără acest utilizator
nouaLista=()
for user in "${loggedInUsers[@]}"; do
  if [ "$user" != "$username" ]; then
    nouaLista+=("$user")
  fi
done

# Actualizăm array-ul
loggedInUsers=("${nouaLista[@]}")

echo "Utilizatorul '$username' a fost delogat cu succes."
