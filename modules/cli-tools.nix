{pkgs, ... }: {
  programs.zsh.enable = true;
  programs.zsh.interactiveShellInit = ''
    # Override the command_not_found_handler to use nh
    command_not_found_handler() {
      nh search "$1"
      return 127
    }
  '';
  # Disable the default NixOS command-not-found perl script to prevent conflicts
  programs.command-not-found.enable = false;
  programs.nix-index.enable = true;
  programs.nix-ld.enable = true;
  programs.tmux.enable = true;

  programs.nh.enable = true;

  programs.git = {
    enable = true;

    config = {
      init.defaultBranch = "main";
      user.name = "Rahinur Bin Naushad";
      user.email = "rahinur2004@gmail.com";
    };
  };

  services.tailscale.enable = true;
  virtualisation.docker.enable = true;

  services.playerctld.enable = true;

  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    supergfxctl
    asusctl

    # Clipboard & Screenshots
    wl-clipboard
    cliphist
    grim
    slurp
    swappy
    
    # Display & Input Debugging
    wlr-randr
    wlopm
    wev
    
    # System Integration
    xdg-utils
    libnotify
    wf-recorder
    
    # Niri Specifics (from previous suggestion)
    nirius

    cava
    wtype
    khal
    brightnessctl
    playerctl
    fuzzel
    pkg-config
    binutils
    openssl
    home-manager
    tailscale
    kanata
    lazygit
    wget
    gcc
    comma
    uv
    python315
    direnv
    pay-respects
    neovim
    starship
    nerd-fonts.fira-code
    bat
    yazi
    stow
    fzf
    fd
    eza
    ripgrep
    zoxide
    git	
    fastfetch
    repomix
    fastfetch
    rbw
  ];




}
