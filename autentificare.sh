#!/bin/bash

file="registruUtilizatori.csv"

echo "======== Autentificare ========"
read -p "Introduceti username-ul: " username

if grep -q "^$username," "$file"; then
  read -s -p "Va rugam introduceti parola pentru contul $username: " parola
  echo
  parolaCurentaHashed=$(echo -n "$parola" | sha256sum)

  liniaCuUsername=$(grep "^$username," "$file")
  parolaHashedDinRegistru=$(echo "$liniaCuUsername" | sed -E "s/^(([^,]*,){3})([^,]*).*/\3/")
  if [ "$parolaCurentaHashed" = "$parolaHashedDinRegistru" ]; then
    echo "Autentificare cu succes!"
    echo "Pentru a parasi instanta aceasta de Bash tastati exit urmat de tasta Enter"
    loggedInUsers+=("$username")
    lastLoginTime=$(date +"%Y-%m-%d %H:%M:%S")
    if [[ "$liniaCuUsername" =~ ,lastLogin= ]]; then
      linieNoua=$(echo "$liniaCuUsername" | sed -E "s/lastLogin=[^,]*/lastLogin=$lastLoginTime/")
      # echo "linia contine lastLogin. Se editeaza valoarea."
    else
      linieNoua="$liniaCuUsername,lastLogin=$lastLoginTime"
      # echo "linia NU CONTINE lastLogin"
    fi
    sed -i "s|^$liniaCuUsername\$|$linieNoua|" "$file"
    cd ~/$username
    bash
    cd -
  else
    echo "Parola introdusa nu se potriveste cu username-ul"
  fi
else
  echo "Utilizatorul nu este inregistrat. Va rugam sa verificati numele sau sa va inregistrati"
  echo
  exit 1
fi
