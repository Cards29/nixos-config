{ pkgs, ... }:

{
  # 1. Install the configuration tool
  environment.systemPackages = with pkgs; [
    kdePackages.dolphin
    kdePackages.qt6ct
    # Optional: if you want to use Kvantum styles with qt6ct
    # kdePackages.qtstyleplugin-kvantum
  ];

  # 2. Tell Qt applications to use qt6ct for themeing
  qt = {
    enable = true;
    platformTheme = "qt5ct"; # Note: NixOS uses "qt5ct" as the option name even for qt6ct support
  };
}
