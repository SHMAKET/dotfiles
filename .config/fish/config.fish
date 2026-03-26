if status is-interactive
    # Commands to run in interactive sessions can go here
    source ~/.alias
    fastfetch --config ~/.config/fastfetch/start-config.jsonc
    fnm env --use-on-cd | source
    set fish_greeting ""
end
