#!/usr/bin/env bash

bat_status=$( cat /sys/class/power_supply/BAT1/capacity )

echo "⧃ $bat_status ⚬⚬⚬"
