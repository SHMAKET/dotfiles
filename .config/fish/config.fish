if status is-interactive
    # Commands to run in interactive sessions can go here
    source ~/.alias
    fastfetch --config ~/.config/fastfetch/start-config.jsonc
    set fish_greeting ""
end
