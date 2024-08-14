#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script requires sudo privileges to run."
  exit 1
fi

sbctl create-keys
sbctl enroll-keys -m
sbctl verify | sed 's/✗ /sbctl sign -s /e'
sbctl status
sbctl sign -s -o /usr/lib/systemd/boot/efi/systemd-bootx64.efi.signed /usr/lib/systemd/boot/efi/systemd-bootx64.efi
sbctl status
