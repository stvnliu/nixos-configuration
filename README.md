# My NixOS configuration
 - system: `"x86_64-linux"`
 - host os: `Linux 6.12.2-zen1, NixOS, 25.05 (Warbler), 25.05.20241229.88195a9`
 - multi-user?: `yes`
 - sandbox: `yes`
 - version: `nix-env (Nix) 2.24.11`
 - channels(root): `"nixos"`
 - nixpkgs: `/nix/store/8vz84mqgnm1gz5yk7hgnnb5gir5hjxas-source`

## Installation

This configuration is dependent on flakes being enabled in the system building the config.  

### Build script 
Build the default version of this configuration.
```
wget https://raw.githubusercontent.com/stvnliu/nixos-configuration/refs/heads/main/deploy.sh 
chmod +x ./deploy.sh
./deploy.sh https://github.com/stvnliu/nixos-configuration nixos-msi
```

or manually:

```
git clone <repo_url> <path_to_config>
sudo nixos-rebuild --flake <path_to_config>#<your_hostname> boot
```

## Features

### Nvidia drivers

This configuration uses Nvidia's new open source 560 drivers, which has decent Wayland support.

### Hyprland and WM components

This configuration contains JavaScript (GJS) configuration files for AGS, the bar used in my Hyprland desktop configuration

### Neovim through Nixvim

Neovim is supported with a wide range of plugin packages that allow a rich editing experience.
