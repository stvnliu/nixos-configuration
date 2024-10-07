# My NixOS configuration

 - system: `"x86_64-linux"`
 - host os: `Linux 6.10.9-zen1, NixOS, 24.11 (Vicuna), 24.11.20241004.bc947f5`
 - multi-user?: `yes`
 - sandbox: `yes`
 - version: `nix-env (Lix, like Nix) 2.91.0

## Installation

This configuration is dependent on flakes being enabled in the system building the config.  

```
sudo nixos-rebuild --flake <path_to_this_config>#<your_hostname> switch
```

## Features

### Nvidia drivers

This configuration uses Nvidia's new open source 560 drivers, which has decent Wayland support.

### Hyprland and WM components

This configuration contains JavaScript (GJS) configuration files for AGS, the bar used in my Hyprland desktop configuration

### Neovim through Nixvim

Neovim is supported with a wide range of plugin packages that allow a rich editing experience.
