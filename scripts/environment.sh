#!/usr/bin/env bash

SCRIPTDIR_V=$(
    cd $(dirname $0)
    pwd
)

# > -------------------
# SETUP PARAMETERS

# The domain for the OpenShift (OKD) cluster.
# IMPORTANT: The domain used to install the cluster CANNOT BE CHANGED! See documentation!
# By Questor
OKD_DOMAIN="domain.abc"

N_INT_LAN="N_INT_LAN"
INT_LAN_24="10.2.0"
I_INT_LAN="en01"

N_OKD_LAN="N_OKD_LAN"

# First 3 octets of OpenShift (OKD) cluster network (forward and reverse).
OKD_LAN_24="10.3.0"
OKD_LAN_24_REVERSE="0.3.10"

# Last octet of the OKD_SERVICES server IP.
OKD_SERVICES_LST_OCT="3"

# Last octet of the OKD_BOOTSTRAP node IP and its MAC address.
OKD_BOOTSTRAP_LST_OCT="19"
OKD_BOOTSTRAP_MAC="52:54:00:07:80:62"

# Last octet of the OKD_MASTER_1 node IP and its MAC address.
OKD_MASTER_1_LST_OCT="4"
OKD_MASTER_1_MAC="52:54:00:7d:97:70"

# Last octet of the OKD_MASTER_2 node IP and its MAC address.
OKD_MASTER_2_LST_OCT="5"
OKD_MASTER_2_MAC="52:54:00:6e:52:85"

# Last octet of the OKD_MASTER_3 node IP and its MAC address.
OKD_MASTER_3_LST_OCT="6"
OKD_MASTER_3_MAC="52:54:00:a3:65:d9"

# Last octet of the OKD_WORKER_1 node IP and its MAC address.
OKD_WORKER_1_LST_OCT="12"
OKD_WORKER_1_MAC="52:54:00:e3:7c:fb"

# Last octet of the OKD_WORKER_2 node IP and its MAC address.
OKD_WORKER_2_LST_OCT="13"
OKD_WORKER_2_MAC="52:54:00:20:ec:4f"

# NOTES:
# I - In case you want to add new master or worker nodes, in the examples above we
# left a gap for 5 sequential IPs for new master nodes (last octets 7, 8, 9, 10 and
# 11) and a gap for 5 sequential IPs for new worker nodes (last octets 14, 15, 16,
# 17 and 18);
# II - All network settings refer to OpenShift (OKD) cluster network ([N]OKD_LAN).
# By Questor

# Available disk space (in GB) for OKD_SERVICES server minus 15. E.g.: 60-15=45.
OKD_SERVICES_STRG_SZ="45"
