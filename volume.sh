#!/bin/bash
vol=$(pamixer --get-volume-human 2>/dev/null)
if [ $? -ne 0 ]; then
    # 兼容 pipewire
    vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>/dev/null | awk '{printf "%.0f%%", $3 * 100}')
fi

if [ -z "$vol" ]; then
    echo "N/A"
else
    echo "$vol"
fi
