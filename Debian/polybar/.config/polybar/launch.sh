#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Launch bar
polybar mybar >>/tmp/polybar.log 2>&1 &

echo "Bar launched..."
