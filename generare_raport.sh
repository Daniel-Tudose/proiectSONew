#!/bin/bash

username="$1"
user_home="/home/max/$username"
report_file="$user_home/raport.txt"

if [ ! -d "$user_home" ]; then
     echo "Eroare: Directorul utilizatorului '$username' nu există."
        mkdir -p "$user_home"
fi

{
    num_files=$(find "$user_home" -type f | wc -l)
    num_dirs=$(find "$user_home" -type d | wc -l)
    total_size=$(du -sh "$user_home" | cut -f1)

    echo "Raport pentru utilizatorul: $username" > "$report_file"
    echo "-------------------------------" >> "$report_file"
    echo "Numar de fisiere: $num_files" >> "$report_file"
    echo "Numar de directoare: $num_dirs" >> "$report_file"
    echo "Dimensiune totala pe disc: $total_size" >> "$report_file"
    echo "Generat la: $(date)" >> "$report_file"
} &

echo "Raportul pentru '$username' este generat in fundal."
