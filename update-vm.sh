# !/bin/bash
NAME=$1

if [ $# -eq 1 ]
then
  sudo sed -i 'd' /etc/hostname
  echo "$NAME" |sudo tee /etc/hostname
  sudo hostnamectl set-hostname "$NAME"
else
  echo "Usage: ./update-vm.sh <New-Hostname>"