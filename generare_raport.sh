#!/bin/bash

username="$1"
user_home="home/$username"
report_file="$user_home/raport.txt"

if [ ! -d "$user_home" ]; then
    echo "Eroare: Directorul utilizatorului '$username' nu există."
    exit 1
fi

{
    num_files=$(find "$user_home" -type f | wc -l)
    num_dirs=$(find "$user_home" -type d | wc -l)
    total_size=$(du -sh "$user_home" | cut -f1)

    echo "Raport pentru utilizatorul: $username" > "$report_file"
    echo "-------------------------------" >> "$report_file"
    echo "Număr de fișiere: $num_files" >> "$report_file"
    echo "Număr de directoare: $num_dirs" >> "$report_file"
    echo "Dimensiune totală pe disc: $total_size" >> "$report_file"
    echo "Generat la: $(date)" >> "$report_file"
} &

echo "Raportul pentru '$username' este generat în fundal."
