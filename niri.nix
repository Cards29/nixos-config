{ pkgs, niri, ... }: {
  # This uses the niri input from your flake
  programs.niri = {
    enable = true;
    package = niri.packages.${pkgs.system}.niri;
  };

  # Add specific niri-related tools here
  environment.systemPackages = with pkgs; [
    waybar
    swaybg
    xwayland-satellite # If you need X11 apps
    swww
  ];
}
