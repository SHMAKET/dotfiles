#!/bin/bash
# =====================================================
# Hyprland Screenshot Tool with Rofi selection + Satty
# Save path: /home/denis/Pictures/Screenshots
# Requires: grim, slurp, wl-copy, notify-send, rofi, satty
# =====================================================

SAVE_DIR="/home/denis/Pictures/Screenshots"
mkdir -p "$SAVE_DIR"

FILENAME="screenshot_$(date +'%F-%H-%M-%S').png"
FULLPATH="${SAVE_DIR}/${FILENAME}"

CHOICE=$(printf "      Full screen\n󰩭      Area\n󰏫     Area + Satty" | rofi -dmenu -p "Take screenshot:")

notify_error() {
    notify-send "󰅙 Screenshot failed" "$1" -u critical
    exit 1
}

notify_saved() {
    notify-send "💾 Screenshot saved" "$1" -r 9999
}

case "$CHOICE" in
    "      Full screen")
        pkill rofi; sleep 0.1
        grim "$FULLPATH" || notify_error "grim failed"
        wl-copy < "$FULLPATH"
        notify_saved "Full screen → $FULLPATH"
        ;;

    "󰩭      Area")
        pkill rofi; sleep 0.1
        grim -g "$(slurp -w 0)" "$FULLPATH" || notify_error "grim/slurp failed"
        wl-copy < "$FULLPATH"
        notify_saved "Area → $FULLPATH"
        ;;

    "󰏫     Area + Satty")
        pkill rofi; sleep 0.1
        grim -g "$(slurp -w 0)" -t png - | tee >(wl-copy) | \
        satty --filename - --output-filename "$FULLPATH" || notify_error "Satty/grim/slurp failed"
        ;;

    *)
        exit 0
        ;;
esac
