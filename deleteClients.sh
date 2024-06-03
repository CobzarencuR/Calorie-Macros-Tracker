#!/bin/bash
IFS=';'
delete_id() {
  local id="$1"
  sed -i "/^${id};/d" "$(find -name "*.csv" -type f)"
  echo "The client with the ID $id was deleted from the file!"
}

ok=1
while [ $ok -eq 1 ]; do
  echo "1. Delete client"
  echo "2. Exit"

  read -p "Choose an option: " option

  case $option in
    1)
      read -p "The client ID to delete: " client_id
      if grep -q "^${client_id};" "$(find -name "*.csv" -type f)"; then
        delete_id "$client_id"
      else
        echo "The client with the ID $client_id was not found!"
      fi
      ;;
    2)
      echo "Exiting..."
      exit
      ;;
    *)
      echo "Invalid option!"
      ;;
  esac
  echo
done

