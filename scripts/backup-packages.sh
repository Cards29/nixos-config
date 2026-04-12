#!/usr/bin/env bash
# Save all installed packages on Arch Linux + other ecosystems

mkdir -p ~/dotfiles/pkg-lists

# === Arch Linux ===
# All official repo packages (explicit only)
pacman -Qne > ~/dotfiles/pkg-lists/pacman.txt

# All AUR / foreign packages (explicit only)
pacman -Qme > ~/dotfiles/pkg-lists/yay.txt

# === Node.js / npm ===
npm list -g --depth=0 --parseable | sed 's#.*/##' > ~/dotfiles/pkg-lists/npm.txt

# === uv (Python env manager) ===
uv pip list --format=freeze | cut -d= -f1 > ~/dotfiles/pkg-lists/uv.txt

# === pip (system or venv) ===
pip list --format=freeze | cut -d= -f1 > ~/dotfiles/pkg-lists/pip.txt

# === Rust / cargo ===
cargo install --list | awk '/^[a-zA-Z0-9_-]+ v/ {print $1}' > ~/dotfiles/pkg-lists/cargo.txt

# === Flatpak ===
flatpak list --app --columns=application > ~/dotfiles/pkg-lists/flatpak.txt

echo "All package lists saved in ~/dotfiles/pkg-lists"
