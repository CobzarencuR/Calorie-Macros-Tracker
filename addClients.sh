#!/bin/bash

last_id() {
    csv_file=$(find -name "*.csv" -type f | head -n 1)
    if [ ! -f "$csv_file" ] || [ ! -s "$csv_file" ]; then
        id=0
    else
        id=$(tail -n 1 "$csv_file" | cut -d ";" -f 1)
        if [ -z "$id" ]; then
            id=0
        fi
    fi
    id=$((id + 1))
}

calories_macros() {
    protein=$(awk "BEGIN { printf \"%.2f\", 2 * $weight }")
    fats=$(awk "BEGIN { printf \"%.2f\", 2.2 * $weight * 0.4 }")

    case $sex in
        M)
            calories=$(awk "BEGIN { printf \"%.2f\", ((66 + 13.7 * $weight + 5 * $height - 6 * $age) * 1.2) }")
            carbs=$(awk "BEGIN { printf \"%.2f\", ($calories - $protein * 4 - $fats * 9) / 4 }")
            arrangement
            ;;
         m)
            calories=$(awk "BEGIN { printf \"%.2f\", ((66 + 13.7 * $weight + 5 * $height - 6 * $age) * 1.2) }")
            carbs=$(awk "BEGIN { printf \"%.2f\", ($calories - $protein * 4 - $fats * 9) / 4 }")
            arrangement
            ;;
        F)
            calories=$(awk "BEGIN { printf \"%.2f\", ((665 + 9.6 * $weight + 1.7 * $height - 4.7 * $age) * 1.2) }")
            carbs=$(awk "BEGIN { printf \"%.2f\", ($calories - $protein * 4 - $fats * 9) / 4 }")
            arrangement
            ;;
         f)
            calories=$(awk "BEGIN { printf \"%.2f\", ((665 + 9.6 * $weight + 1.7 * $height - 4.7 * $age) * 1.2) }")
            carbs=$(awk "BEGIN { printf \"%.2f\", ($calories - $protein * 4 - $fats * 9) / 4 }")
            arrangement
            ;;
    esac
}

verify_name() {
name_ok=0
while [ $name_ok -eq 0 ]
do
  if echo "$name" | grep -qE '^[A-Z][a-z]{1,20}$'; then
     name_ok=1
  else
     echo  ""
     echo "The name is invalid!"
     echo "Enter the client's name correctly: "
     read name
  fi
done
}

verify_sex() {
sex_ok=0
while [ $sex_ok -eq 0 ]
do
        case $sex in
   M)
        sex_ok=1
        ;;
   m)
        sex_ok=1
        ;;
   F)
        sex_ok=1
        ;;
   f)
        sex_ok=1
        ;;
   *)
        echo ""
        echo "The sex is invalid!"
        echo "Enter the client's sex correctly: "
        read sex
        ;;
    esac
done
}

verify_age() {
age_ok=0
while [ $age_ok -eq 0 ]
do
  if echo "$age" | grep -qE '^[1-9][0-9]$'; then
     age_ok=1
  else
     echo ""
     echo "The age is invalid!"
     echo "Enter the client's age correctly: "
     read age
  fi
done
}

verify_weight() {
weight_ok=0
while [ $weight_ok -eq 0 ]
do
  if echo "$weight" | grep -qE '^[1-9][0-9]{1,2}$'; then
     weight_ok=1
  else
     echo ""
     echo "The weight is invalid!"
     echo "Enter the client's weight correctly: "
     read weight
  fi
done
}

verify_height() {
height_ok=0
while [ $height_ok -eq 0 ]
do
  if echo "$height" | grep -qE '^[1-2][0-9]{2}$'; then
     height_ok=1
  else
     echo ""
     echo "Th height is invalid!"
     echo "Enter the client's height correctly: "
     read height
  fi
done
}

arrangement() {
    csv_file=$(find -name "*.csv" -type f | head -n 1)
    if [ ! -f "$csv_file" ]; then
        csv_file="clients.csv"
        echo "ID;Name;Sex;Age;Weight;Height;Calories;Carbs;Protein;Fats" >> "$csv_file"
    elif [ ! -s "$csv_file" ]; then
        echo "ID;Name;Sex;Age;Weight;Height;Calories;Carbs;Protein;Fats" >> "$csv_file"
    fi
    data="$id;$name;$sex;$age;$weight;$height;$calories;$carbs;$protein;$fats"
    echo "$data" >> "$csv_file"
}

nr_clients(){
echo "How many clients do you want to add?"
read nrClients
for ((i=1; i<=nrClients; i++))
  do
    last_id
    echo "Client nr.$id"
    echo "Enter the client's name:"
    read  name
    verify_name
    echo "Enter the client's sex(M/F):"
    read  sex
    verify_sex
    echo "Enter the client's age(years):"
    read  age
    verify_age
    echo "Enter the client's weight(kg):"
    read  weight
    verify_weight
    echo "Enter the client's height(cm):"
    read  height
    verify_height
    calories_macros
done
}

nr_clients

