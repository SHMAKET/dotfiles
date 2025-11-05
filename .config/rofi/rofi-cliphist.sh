#!/usr/bin/env bash
# Clipboard manager using cliphist + rofi
# Ctrl + x → wipe

while true; do
    result=$(
        rofi -dmenu \
            -i \
            -p "" \
            -kb-custom-2 "Control+x" \
            -theme-str 'entry { placeholder: "[Ctr + X] Wipe ALL"; }' \
            < <(cliphist list)
    )

    case "$?" in
        1)  # rofi закрыт (Esc)
            exit
            ;;
        0)  # Enter — просто копировать выбранное
            if [ -n "$result" ]; then
                cliphist decode <<< "$result" | wl-copy
            fi
            exit
            ;;
        11)  # custom-2 = Ctrl+x
            # Полное очищение истории
            cliphist wipe
            ;;
    esac
done
