{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # C / C++
    clang-tools  # provides clang-format

    # Rust
    rustfmt

    # Python
    black
    isort

    # Lua
    stylua

    # (Optional: keep if you still use prettier anywhere)
    prettier
  ];
}
