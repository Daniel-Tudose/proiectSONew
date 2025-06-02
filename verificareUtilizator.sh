#!/bin/bash

file="registruUtilizatori.csv"
#veficam daca exista fisierul registruUtilizatori.csv; daca nu exista afisam >
if [ ! -e "$file" ]; then
  echo "Se initializeaza registrul utilizatorilor"
  touch "$file"
fi
numarAparitii=$(grep -i "^$1," "$file" | wc -l)
if [ "$numarAparitii" -eq 0 ]; then
  echo "Username-ul $1 este valabil!"
  exit 0
else
  echo "Acest username este deja folosit. Alege altul!"
  exit 1
fi
