#!/usr/bin/env bash

BATTERY="BAT0"
POWER_FILE="/sys/class/power_supply/${BATTERY}/power_now"
STATUS_FILE="/sys/class/power_supply/${BATTERY}/status"

# Проверки
if [ ! -f "$POWER_FILE" ] || [ ! -f "$STATUS_FILE" ]; then
    echo "N/A"
    exit 0
fi

status=$(cat "$STATUS_FILE")
pow_raw=$(cat "$POWER_FILE")
# Конвертация микроватт → ватт
pow_w=$(echo "scale=2; $pow_raw/1000000" | bc)

if [ "$status" = "Full" ]; then
    echo ""
else
    # Показываем текущую мощность батареи
    echo "${pow_w}W"
fi
