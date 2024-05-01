#!/usr/bin/env bash

## This Script installs ibm cert manager operator 

SCRIPTDIR_V=$(
  cd $(dirname $0)
  pwd
)

source "${SCRIPTDIR_V}/environment.sh"
source "${SCRIPTDIR_V}/utils.sh"
