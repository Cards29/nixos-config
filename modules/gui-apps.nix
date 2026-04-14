{pkgs, inputs, ... }: 

{
  programs.firefox.enable = true;
  programs.steam.enable = true;
  programs.vscode.enable = true;

  environment.systemPackages = with pkgs; [
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
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
