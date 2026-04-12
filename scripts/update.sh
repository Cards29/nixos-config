#!/bin/bash

# --- System & AUR ---
echo "--- Updating System & AUR (yay) ---"
# --noconfirm skips all yes/no prompts
# --sudoloop prevents the password from timing out
yay -Syu --noconfirm --needed --sudoloop
echo ""

# --- Rust Ecosystem ---
echo "--- Updating Rust Toolchain & Cargo Binaries ---"
rustup update
cargo install-update -a
echo ""

# --- Go Ecosystem ---
echo "--- Updating Go Binaries (Shadow, etc.) ---"
go-global-update
echo ""

# --- JavaScript / Node.js ---
echo "--- Updating Global NPM Packages ---"
npm update -g
echo ""

# --- Python Ecosystem ---
echo "--- Updating Python CLI Tools (uv) ---"
uv tool upgrade --all
echo ""

# --- Flatpak Applications ---
echo "--- Updating Flatpak Apps ---"
# -y skips the "Proceed with installation?" prompt
flatpak update -y
echo ""

echo "--------------------------------------"
echo "All updates are done! Your Arch system is current."
echo "--------------------------------------"
