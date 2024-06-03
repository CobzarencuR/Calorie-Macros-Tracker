#!/bin/bash

k=101
while [ $k -ne 0 ]
do
  clear
  echo "~~~~~~~~~~~~~~~~~~~"
  echo "      COMMANDS      "
  echo "~~~~~~~~~~~~~~~~~~~"
  echo "1. Create file"
  echo "2. Add clients"
  echo "3. Delete clients"
  echo "4. Sort clients"
  echo "5. Exit"
  echo "~~~~~~~~~~~~~~~~~~~"
  echo ""
  echo "Select a command:"
read a
  case $a in
        1)
                ./createFile.sh
                sleep 2;
                echo "The file was created successfully!";
                ;;
        2)
                ./addClients.sh
                sleep 1;
                echo "The clients were added to the file successfully!";
                sleep 2;
                ;;
        3)
                ./deleteClients.sh
                sleep 1;
                echo "The clients were deleted from the file successfully!";
                sleep 2;
                ;;
        4)

                ./sortClients.sh
                sleep 1;
                echo "The clients were sorted successfully!";
                sleep 2;
                ;;
        5)
                echo "Exit successful!";
                exit 0
                ;;
        *)
                echo "Invalid option!";
                ;;
esac
done
