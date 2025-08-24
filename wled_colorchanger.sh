#!/bin/bash

IP="$1"
if [[ -z "${IP}" ]]; then
  echo "Usage: $0 <IP of wled device>"
  exit 1
fi

. ~/.cache/wal/colors.sh

# pywal provides hex coloes, wled wants rgb tripplets
function hex2rgb {
  local col="$1"

  local col_r=$(printf "%d" 0x${col:1:2})
  local col_g=$(printf "%d" 0x${col:3:2})
  local col_b=$(printf "%d" 0x${col:5:2})
  echo "$col_r,$col_g,$col_b"
}

# color0 is usually relly dark, color3 seems to work nicely
curl -X POST "http://${IP}/json/state" -d '{"on":true,"seg":[{"id":0,"col":[['$(hex2rgb $color3)']]}]}' -H "Content-Type: application/json"

