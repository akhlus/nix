# Repo that stores nix modules, templates and other stuff

## Modules

### Darwin Modules
Exposes the modules:
- darwin: System configuration such as dock setup and brew packages
- home: Adds home-manager integration with the default home module included
- default: Both of the above

### Home Modules
Exposes the modules:
- default: Opionated home-manager setup with cosmetic options as well as package options
- de: Adds DE customisation options for GNOME and KDE. Should only be used on Linux
- all: Both of the above

### NixOS Modules
Exposes the modules:
- nixos: System configuration for Linux
- home: Home-manager integration with the default home module included
- default: Both of the above

## Templates

There are currently flake templates for the following setups:
- darwin: Nix-Darwin system configuration using the modules in this repo to give an opionated setup. Has options to include home-manager by default (default) or not (darwin)
- go: Dev tools for golang projects
- go-package: Flake that sets up packaging a go project into a nix package for use in flakes
- home: Home-manager setup using the home modules in this repo. Has an option to also include DE customisation for GNOME and KDE (all) or not (home)
- jovian: NixOS flake that includes Jovian config that allows for steam-deck like interface
- latex: Tools to locally write and compile a LaTeX doc with barebones project setup
- minimal: Bare minimum flake that only has nixpkgs as input and no outputs
- mobile: Mobile NixOS system flake that includes install instructions
- nixos: Opionated NixOS system that uses the nixos modules in this repo. Has options to include home-manager (default) or not (nixos)
- python: Dev tools for python development with external package support
- shell: Unpopulated devShell with .envrc to allow for direnv integration
