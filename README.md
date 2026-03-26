# MY HYPRLAND RICE
This rice uses configs from many repos, so it's not 100% pure my creation
<img width="1920" height="1080" alt="screenshot" src="https://github.com/SHMAKET/dotfiles/blob/master/screenshots/screenshot_2025-11-15-18-38-44.png" />

## Restore

### Configs
```bash

```

### Packages
```bash
sudo pacman -S --needed - < pkgs_pacman.txt
paru -S --needed - < pkgs_aur.txt
```

### Services
```bash
xargs sudo systemctl enable < services_system.txt
xargs systemctl --user enable < services_user.txt
```

### Autostart (Hyprland)
Managed via `.config/hypr/configs/autostart.conf` — already in this repo.