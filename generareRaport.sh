#!/bin/bash

username="$1"
user_home="home/$username"
raport_fisier="$user_home/raport.txt"

if [ ! -d "$user_home" ]; then 
  echo "Utilizatorul nu are directorul home."
  exit 1
fi

(
  echo "Raport pentru utilizatorul: $username" > "$raport_fisier"
  echo "Generat la: $(date)" >> "$raport_fisier"
  echo "Dimensiunea totala pe disc: $SIZE" >> "$raport_fisier"
  echo "------------------------------------" >> "$raport_fisier"

  fisiere=$(find "$user_home" -type f | wc -1)
  dirs=$(find "$user_home" -type d | wc -1)
  size=$(du -sh "$user_home" | cut -f1)
  
  echo "Raport generat cu succes." >> "$raport_fisier"
  
) &

echo "Raportul este generat pentru utilizatorul $username."
