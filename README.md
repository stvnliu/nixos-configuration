# My NixOS configuration

- system: `"x86_64-linux"`
- host os: `Linux 6.6.44, NixOS, 24.11 (Vicuna), 24.11.20240804.cb9a96f`
- multi-user?: `yes`
- sandbox: `yes`
- version: `nix-env (Nix) 2.18.5`
- channels(root): `"nixos"`
- nixpkgs: `/nix/store/4cpakzyvfw1rmm9v5i3387x6jd2h1v86-source`

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
