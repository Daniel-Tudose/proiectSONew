#!/bin/bash

while true
do
  read -p "Alegeti un nume de utilizator: " utilizator
  ./verificareUtilizator.sh "$utilizator"
  if [ $? -eq 0 ]; then
    break
  fi
done

while true
do
  read -p "Introduceti adresa de email: " mail
  ./verificareMail.sh "$mail"
  if [ $? -eq 0 ]; then
    break
  fi
done

while true
do
  read -s -p "Alegeti o parola: " parola
  echo
  ./verificareParola.sh "$parola"
  if [ $? -eq 0 ]; then
    break
  fi
done

while true; do
  read -s -p "Reintroduceti parola: " parola2
  if [ "$parola" = "$parola2" ]; then
    echo
    # echo "Parolele se potrivesc!"
    break
  else
    echo "Parolele nu se potrivesc!"
  fi
done

#id-ul este in functie de data, in secunde si nano secunde, la care se adauga un random number
user_id="ID_$(date +%s%N)_$RANDOM"
hashedPassword=$(echo -n "$parola" | sha256sum)
file="registruUtilizatori.csv"
echo "$utilizator,$mail,$user_id,$hashedPassword" >> "$file"
echo "Utilizatorul $utilizator a fost inregistrat cu succes!"

if hostname | grep -q "DESKTOP-8JBOPMU"; then
  mkdir -p "/home/max/$utilizator"
  # adaugam & pentru a trimite in background procesul de trimitere a mailului pentru ca dureaza prea mult
  echo -e "Subject: Înregistrare completă\n\nSalut, $utilizator!\nContul tău a fost înregistrat cu succes pe platforma noastră." | msmtp "$mail" &
else
  mkdir -p "/home/stud1028/Manushii/home/$utilizator"
  echo "Utilizatorul $utilizator a fost inregistrat cu succes! Emailul de confirmare nu poate fi trimis momentan. Ne cerem scuze pentru inconvenient."
fi

