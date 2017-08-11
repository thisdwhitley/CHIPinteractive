#!/bin/bash
#:Title	: menu
#!Date	: 2017-08-06
#!Author: dswhitley
#!Ref   : https://docs.getchip.com/chip.html#customize-buildroot
while true; do
  clear;
  echo "                 #  #  #               ";
  echo "               #########               ";
  echo "             ###       ###             ";
  echo "               # {#}   #               ";
  echo "             ###  '%######             ";
  echo "               #       #               ";
  echo "             ###       ###             ";
  echo "               ########                ";
  echo "                #  #  #                ";
  echo "=======================================";
  echo "Menu...                                ";
  echo "=======================================";
  echo "Enter 0 to revert back to default      ";
  echo "Enter 1 to customize buildroot         ";
  echo "Enter 2 to customize Linux             ";
  echo "Enter 3 to flash with customizations   ";
  echo "Enter 4 to stop this container         ";
  echo "                                       ";
  echo "=======================================";
  echo "Enter option Number:                   ";

  read answer;
  case "$answer" in
    0) clear;
       echo "...ensure that your C.H.I.P. board is jumpered for 'fel' mode as noted in the documentation";
       sleep 5;
       cd /CHIP-tools;
       ./chip-update-firmware.sh -s
       clear;
       echo "Your C.H.I.P. has been flashed with the NTC firmware.";
       echo "You can remove the jumper and boot it normally...";
       echo "Or set up another one.";
       read -p "= Press any key to continue..." -n1 -s;;
    1) clear;
       echo "You will be presented with a TUI in which to customize your build:";
       sleep 5;
       cd /CHIP-buildroot;
       make chip_defconfig;
       make nconfig;
       clear;
       echo "This next step will take a long time, please be patient.";
       read -p "= Press any key to continue..." -n1 -s;
       # this appears to be a bug, but remove atenart:
       sed -i 's/atenart/nextthingco/' /CHIP-buildroot/package/dtc-overlay/dtc-overlay.mk;
       make;
       read -p "= Press any key to continue..." -n1 -s;;
    2) echo "and this is linux-config";
       read -p "= Press any key to continue..." -n1 -s;;
    3) echo "this step will use the custom rootfs to update the C.H.I.P.";
       cd /CHIP-tools;
       echo "Create buildroot's intermediate image files";
       # I should make outputdir a volume in my container...
       ./chip-create-nand-images.sh ../CHIP-buildroot/output/build/uboot* ../CHIP-buildroot/output/images/rootfs.tar outputdir;
       echo "...ensure that your C.H.I.P. board is jumpered for 'fel' mode as noted in the documentation";
       sleep 5;
       ./chip-update-firmware.sh -L outputdir/;
       echo "Your C.H.I.P. has been flashed with customized firmware.";    
       read -p "= Press any key to continue..." -n1 -s;;
    4) echo "you wanted to exit, here we go"; exit
  esac
  echo "Enter new option:";
done;
