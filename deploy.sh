#!/usr/bin/env sh

# Deploys the configuation to your machine

TMP_DIRNAME="/tmp/nix-config"
GIT_REMOTE_SRC=$1
NIX_HOST="<YOUR_HOSTNAME_HERE>"
echo "Going to clone $GIT_REMOTE_SRC into $TMP_DIRNAME"
mkdir "$TMP_DIRNAME"

git clone "$GIT_REMOTE_SRC" "$TMP_DIRNAME"
prev=$PWD
cd "$TMP_DIRNAME" || return
echo "Now going to build nix configuration for $NIX_HOST to switch on next boot"
sudo nixos-rebuild --flake .#$NIX_HOST boot

cd "$prev" || return

