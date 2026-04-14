{ config, pkgs, ... }:

{
  # Maintenance and Cleanup
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep 7 --keep-since 7d";
    flake = "/etc/nixos";
  };

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
