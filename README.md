# Nix / Nix Darwin Setup for Arif's MacBook

This repository contains the config for setup for my preferred Development environment.

## Key Features

### System Configuration Applied

### Apple Store Packages Installed

### Homebrew Packages Installed

### NIX Packages Installed

## Pre-requisites

1. **Fresh Mac Device**: Mainly tested with a device where all content and settings have been erased (factory reset).

1. **Change the name of the device (optional)**: I would recommend all lower case letters. Also, use the hostname command on the terminal to get the script friendly version of the hostname.

   ```
   hostname
   ```

1. **Install NIX:** I prefer to use the Determinate Systems installer as this also provides an easy method for removal.

   ```
   curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
   ```

1. **Install Homebrew:** Using the standard script.

   ```
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

## Installation

1. **Run the Config**

   ```
   nix run nix-darwin --extra-experimental-features nix-command --extra-experimental-features flakes -- switch --flake github:adatoo/nix-darwin/setup-basic-config --no-write-lock-file
   ```

## Uninstalling

There are several steps required to uninstall the system:

1. **_Remove nix-darwin components_**

   ```

   ```

1. **Remove nix**

   ```
   /nix/nix-installer uninstall
   ```
