{pkgs, ... }: {
  programs.zsh.enable = true;
  programs.nix-index.enable = true;
  programs.nix-ld.enable = true;
  programs.tmux.enable = true;

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

  environment.systemPackages = with pkgs; [
    pkg-config
    binutils
    openssl
    home-manager
    xdg-utils
    tailscale
    kanata
    lazygit
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    gcc
    rustup
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
