#!/usr/bin/bash

# Replace with your actual interface names
ETH="enp0s31f6"
WIFI="wlp0s20f3"

# Check if ethernet is connected
if ip link show "$ETH" | grep -q "state UP" && \
   nmcli dev show "$ETH" | grep -q "GENERAL.STATE:.*connected"; then
  echo "$ETH"
elif ip link show "$WIFI" | grep -q "state UP"; then
  echo "$WIFI"
else
  echo "none"
fi

