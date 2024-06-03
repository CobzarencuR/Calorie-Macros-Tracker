#!/bin/bash

while true; do
echo "1. Sort ascending by weight"
echo "2. Sort descending by calorie requirement"
echo "3. Exit"
read -p "Choose an option: " option

  case $option in
    1)
     sort_data=$(tail -n +2 "$(find -name *.csv)" | sort -t\; -k5 -n)
     echo "The sorting was done in the file named sort_asc_weight.txt"
     echo "ID;Name;Sex;Age;Weight;Height;Calories;Carbs;Protein;Fats" > "sort_asc_weight.txt"
     echo "$sort_data" >> "sort_asc_weight.txt"
      ;;
    2)
     sort_data=$(tail -n +2 "$(find -name *.csv)" | sort -t\; -k7 -nr)
     echo "The sorting was done in the file named sort_desc_kcal.txt"
     echo "ID;Name;Sex;Age;Weight;Height;Calories;Carbs;Protein;Fats" > "sort_desc_kcal.txt"
     echo "$sort_data" >> "sort_desc_kcal.txt"
      ;;
    3)
      echo "Exiting..."
      exit 0
      ;;
    *)
      echo "Invalid option!"
      ;;
  esac
echo
done

