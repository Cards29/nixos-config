{ config, pkgs, ... }:

{
  # Automatic Updates
  system.autoUpgrade = {
    enable = true;
    flake = "/etc/nixos";
    flags = [
      "--update-input" "nixpkgs"
      "--commit-lock-file"
    ];
    dates = "weekly";
    randomizedDelaySec = "45min";
  };
}
