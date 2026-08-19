# Erik's personal config and setup init
This repository contains a script to setup a new machine with all my opinionated setup configurations and scripts

## Requirements
- Only applicable to macOS or linux
- Custom keyboard bindings only apply to german keyboard layout

Following programs are expected to be installed and setup, before running the `init.sh` script:
- [Karabiner](https://karabiner-elements.pqrs.org/)
- [Homebrew](https://brew.sh/)
- Vim 9

## Initialization
Clone this repository and simply run `./init.sh`.
This script will:
1. Detect if script runs on macOS (local) or linux (remote, skips keyboard init)
2. Copy alias file and init it in bashrc/zsrc
3. Setup Vim
4. Setup they keyboard layout for karabiner if on macOS and karabiner installed

## Keyboard layout
The caps-lock key is repurposed to i) activate a symbol layer when hold and ii) act as escape key when pressed alone.
![Capslock layer layout](./assets/caps-layer.png)

