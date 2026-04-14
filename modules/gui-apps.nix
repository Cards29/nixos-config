{pkgs, ... }: 

{
  programs.firefox.enable = true;
  programs.steam.enable = true;
  programs.vscode.enable = true;

  environment.systemPackages = with pkgs; [
    gnomeExtensions.tweaks-in-system-menu
    gnome-extension-manager
    gnome-tweaks
    ticktick
    kitty
    vesktop
    telegram-desktop
    antigravity
  ];
}
