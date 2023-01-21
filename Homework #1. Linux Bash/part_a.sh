#! /bin/bash

case $1 in
   --all)
    echo "displays the IP addresses and symbolic names of all hosts in the current subnet" 
    sudo arp-scan --localnet | cut -f 1,3 
    ;;
  --target)
    echo "displays a list of open system TCP ports."
    ss -tlpn
    ;; 
  *)
  echo -e "The --all key displays the IP addresses and symbolic names of all hosts in the current subnet.\nThe --target key displays a list of open system TCP ports."
  ;;
  esac
