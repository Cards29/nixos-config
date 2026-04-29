{ config, pkgs, ... }:

{
  # Enable Steam (even if not used, it sets up essential drivers and udev rules)
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  # Optimization for gaming
  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    # Launchers & Compatibility
    lutris
    bottles
    # wine-wayland
    # wineWowPackages.stable # Staging often has better compatibility for repacks
    winetricks
    protonup-qt # Easiest way to install Proton-GE for Lutris/Bottles

    # Utilities for Repacks & Performance
    vulkan-tools
    mangohud # Performance overlay
    p7zip # Necessary for many archive-based installers
    # gnome.adwaita-icon-theme # Prevents crashes in GTK-based installers
  ];

  nixpkgs.config.packageOverrides = pkgs: {
    openldap = pkgs.openldap.overrideAttrs (oldAttrs: {
      doCheck = false;
    });
  };

  # Modern Hardware Graphics Configuration (NixOS 24.05+)
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Kernel tweaks for gaming performance (optional)
  boot.kernel.sysctl = {
    "vm.max_map_count" = 2147483642; # Required for some modern titles and heavy launchers
  };
}
