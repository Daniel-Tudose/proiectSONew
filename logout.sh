#!/bin/bash

fisier_temporar="logged_users.tmp"

# Verifică dacă fișierul de sesiune există
if [ ! -f "$fisier_temporar" ]; then
    echo "Nu exista utilizatori autentificati."
    exit 1
fi

echo "Introdu numele de utilizator pentru logout:"
read USERNAME


if grep -q "^$username$" "$fisier_temporar"; then
    sed -i "/^$username$/d" "$fisier_temporar"
    echo "Utilizatorul '$username' a fost deconectat cu succes."
else
    echo "Utilizatorul '$username' nu este autentificat."
fi
