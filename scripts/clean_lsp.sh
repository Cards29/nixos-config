#!/bin/bash

# List of LSP packages
LSP_PACKAGES=(
    "lua-language-server"
    "typescript-language-server"
    "vscode-langservers-extracted"
    "tailwindcss-language-server"
    "svelte-language-server"
    "graphql-language-service-cli"
    "emmet-language-server"
    "prisma-language-server"
    "pyright"
)

echo "Cleaning up LSPs..."

# Using yay (or change to paru/pacman as needed)
# -R: remove
# -s: recursive (remove unused dependencies)
# -n: ignore backup files
yay -Rsn "${LSP_PACKAGES[@]}"

echo "Done! Your system is clean."
