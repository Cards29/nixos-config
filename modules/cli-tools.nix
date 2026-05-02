{ pkgs, ... }:
{
  # --- Shell & Terminal Environment ---
  programs.zsh = {
    enable = true;
  };

  programs.nh.enable = true;
  programs.nix-index.enable = true;
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc
    zlib
    glib
    gtk3
    libxml2
    freetype
    fontconfig
    xorg.libX11
    xorg.libXrender
    xorg.libXtst
    xorg.libXi
    xorg.libXrandr
  ];
  programs.command-not-found.enable = false;

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true; # This is the bridge for your Rust flakes
  };

  programs.git = {
    enable = true;
    config = {
      init.defaultBranch = "main";
      user.name = "Rahinur Bin Naushad";
      user.email = "rahinur2004@gmail.com";
    };
  };

  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
  };

  # --- System Services ---
  services.tailscale.enable = true;
  services.playerctld.enable = true;
  services.asusd.enable = true;
  virtualisation.docker.enable = true;

  # --- System Packages (The Essentials Only) ---
  environment.systemPackages = with pkgs; [
    # 0. Others
    repomix
    youtube-tui
    ffmpeg
    sqlite
    inotify-tools
    mpvpaper
    jq
    distrobox-tui
    distrobox
    speedtest-cli
    socat
    yt-dlp
    chafa
    scrcpy
    pinentry-curses

    # 1. System Recovery & Core Utilities
    vim
    neovim # Your primary editor
    wget
    fastfetch
    stow # For your dotfiles
    home-manager
    comma # "nix run" shorthand - vital for keeping system clean

    # 2. Hardware Support (Zenbook 14)
    supergfxctl
    asusctl
    brightnessctl
    kanata

    # 3. TUI File Management & Navigation
    yazi
    fzf
    fd
    eza
    ripgrep
    zoxide
    bat
    starship

    # 4. Wayland / Niri Environment
    wl-clipboard
    cliphist
    grim
    slurp
    swappy
    wf-recorder
    libnotify
    xdg-utils
    wlr-randr
    wlopm
    wev
    wtype
    fuzzel
    nirius

    # 5. Daily Drivers & Style
    rbw # Bitwarden CLI
    lazygit
    cava
    playerctl
    khal
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono

    # 6. Archive and Extraction Tools
    p7zip
    zip
    unzip
    unrar
    zstd
    xz
    gzip
    bzip2

    # universal extractor
    ouch
    atool
  ];
}
