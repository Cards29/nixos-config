{ pkgs, ... }: {

  # --- Shell & Terminal Environment ---
  programs.zsh = {
    enable = true;
    interactiveShellInit = ''
      command_not_found_handler() {
        nh search "$1"
        return 127
      }
    '';
  };

  programs.nh.enable = true;
  programs.nix-index.enable = true;
  programs.nix-ld.enable = true; 
  programs.command-not-found.enable = false;

  programs.tmux.enable = true;
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

  # --- System Services ---
  services.tailscale.enable = true;
  services.playerctld.enable = true;
  virtualisation.docker.enable = true;

  # --- System Packages (The Essentials Only) ---
  environment.systemPackages = with pkgs; [
    # 0. Others
    scrcpy

    # 1. System Recovery & Core Utilities
    vim
    neovim # Your primary editor
    wget
    fastfetch
    stow   # For your dotfiles
    home-manager
    comma  # "nix run" shorthand - vital for keeping system clean

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
  ];
}
