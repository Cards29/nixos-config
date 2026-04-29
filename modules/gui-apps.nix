{
  pkgs,
  inputs,
  ...
}:
{
  programs.firefox.enable = true;
  programs.vscode.enable = true;
  programs.kdeconnect.enable = true;
  services.flatpak.enable = true;

  environment.systemPackages = with pkgs; [
    gnome-software
    zathura
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

  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };
}
