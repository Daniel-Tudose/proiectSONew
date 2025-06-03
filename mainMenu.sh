#!/bin/bash

loggedInUsers=()

echo "Salut! Bine ai venit!"
while [ "1" = "1" ]
do
  echo "Alege numarul corespunzator optiunii pe care doresti sa o accesezi:"
  echo "1 - Inregistrare utilizator nou"
  echo "2 - Autentificare utilizator deja existent"
  echo "3 - Genereaza un raport pentru un anumit utilizator"
  echo "4 - Pentru limba spaniola"
  echo "5 - Logout"
  echo "Q - pentru a parasi programul"

  echo -n "Optiunea: "
  read optiune

  if [ "$optiune" = "1" ]; then
    ./inregistrare.sh
  elif [ "$optiune" = "2" ]; then
    source autentificare.sh
  elif [ "$optiune" = "3" ]; then
    echo "Introdu numele utilizatorului: "
    read utilizator
    ./generare_raport.sh "$utilizator"
  elif [ "$optiune" = "4" ]; then
    echo "Los siento. No hablas espanol, pero aqui estan los usuarios en linea: ${loggedInUsers[@]}"
  elif [ "$optiune" = "5" ]; then
      echo "Introdu numele utilizatorului pentru logout:"
  source logout.sh "$utilizator"
  elif [ "$optiune" = "Q" ] || [ "$optiune" = "q" ]; then
    echo "La revedere!"
    exit 0
  fi
done
