#!/usr/bin/env bash

## This Script installs ibm cert manager operator 

SCRIPTDIR_V=$(
  cd $(dirname $0)
  pwd
)

source "${SCRIPTDIR_V}/environment.sh"
source "${SCRIPTDIR_V}/utils.sh"

# > ------------------
# Public Network setup
# File ./templates/okd_public_network.xml

cp "$SCRIPTDIR_V/templates/okd_public_network.xml" "$SCRIPTDIR_V/okd_public_network.xml"
cp "$SCRIPTDIR_V/templates/okd_private_network.xml" "$SCRIPTDIR_V/okd_private_network.xml"

f_ez_sed "<N_INT_LAN>" "$N_INT_LAN" "$SCRIPTDIR_V/okd_public_network.xml" 1
f_ez_sed "<I_INT_LAN>" "$I_INT_LAN" "$SCRIPTDIR_V/okd_public_network.xml" 1
f_ez_sed "<INT_LAN_24>" "$INT_LAN_24" "$SCRIPTDIR_V/okd_public_network.xml" 1

# < -------------------

# > ------------------
# Private Network setup
# File ./templates/okd_private_network.xml

f_ez_sed "<N_OKD_LAN>" "$N_OKD_LAN" "$SCRIPTDIR_V/okd_private_network.xml" 1
f_ez_sed "<OKD_LAN_24>" "$OKD_LAN_24" "$SCRIPTDIR_V/okd_private_network.xml" 1
