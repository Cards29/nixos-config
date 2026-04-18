{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bottles
    wineWowPackages.stable
    winetricks
    vulkan-tools
    # Required for many repack installers to not crash
    gnome.adwaita-icon-theme 
  ];
  
  # Ensure hardware acceleration is enabled
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
}
