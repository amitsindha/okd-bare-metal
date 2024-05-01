#!/usr/bin/env bash

## This Script installs ibm cert manager operator 

SCRIPTDIR_V=$(
  cd $(dirname $0)
  pwd
)

source "${SCRIPTDIR_V}/init.sh"

apt install bridge-utils qemu-kvm virtinst libvirt-daemon virt-manager -y

source "${SCRIPTDIR_V}/network_setup.sh"
