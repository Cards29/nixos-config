{pkgs, inputs, ... }: 

{
  programs.firefox.enable = true;
  programs.steam.enable = true;
  programs.vscode.enable = true;
  programs.kdeconnect.enable = true;

  environment.systemPackages = with pkgs; [
    obs-studio
    localsend
    qbittorrent
    mpv
    bitwarden-desktop
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    gnome-tweaks
    ticktick
    kitty
    vesktop
    telegram-desktop
    antigravity
  ];
}
