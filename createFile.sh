#!/bin/bash

echo "Name the file:"
read name
if [ $(find . -maxdepth 1 -type f -name "*.csv" | wc -l) -gt 0 ]; then
	echo "Error: There is already another CSV file in the current directory!"
else
	echo "ID;Name;Sex;Age;Weight;Height;Calories;Carbs;Protein;Fats" > "${name}.csv"
	echo "The file was created successfully!"
fi
