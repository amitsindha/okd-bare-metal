#!/usr/bin/env bash

## This Script installs ibm cert manager operator 

SCRIPTDIR_V=$(
  cd $(dirname $0)
  pwd
)

#source "${SCRIPTDIR_V}/init.sh"

echo "Public Network setup"

cp "$SCRIPTDIR_V/templates/okd_public_network.xml" "$SCRIPTDIR_V/okd_public_network.xml"
cp "$SCRIPTDIR_V/templates/okd_private_network.xml" "$SCRIPTDIR_V/okd_private_network.xml"

f_ez_sed "<N_INT_LAN>" "$N_INT_LAN" "$SCRIPTDIR_V/okd_public_network.xml" 1
f_ez_sed "<I_INT_LAN>" "$I_INT_LAN" "$SCRIPTDIR_V/okd_public_network.xml" 1
f_ez_sed "<INT_LAN_24>" "$INT_LAN_24" "$SCRIPTDIR_V/okd_public_network.xml" 1

echo "Private Network setup"

f_ez_sed "<N_OKD_LAN>" "$N_OKD_LAN" "$SCRIPTDIR_V/okd_private_network.xml" 1
f_ez_sed "<OKD_LAN_24>" "$OKD_LAN_24" "$SCRIPTDIR_V/okd_private_network.xml" 1

virsh net-define "$SCRIPTDIR_V/okd_public_network.xml"
virsh net-autostart "$N_INT_LAN"
virsh net-start "$N_INT_LAN"
virsh net-define "$SCRIPTDIR_V/okd_private_network.xml"
virsh net-autostart "$N_OKD_LAN"
virsh net-start "$N_OKD_LAN"
virsh net-list --all

rm -rf "$SCRIPTDIR_V/okd_private_network.xml"
rm -rf "$SCRIPTDIR_V/okd_private_network.xml"


