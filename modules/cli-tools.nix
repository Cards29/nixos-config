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


  programs.tmux = {
    enable = true;
    shortcut = "a";       # Sets prefix to Ctrl-a
    baseIndex = 1;        # Start windows/panes at 1
    escapeTime = 0;       # Lower escape timing for snappier response
    keyMode = "vi";       # vi-style keybindings

    # These plugins are handled by Nix instead of TPM
    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      resurrect
      continuum
    ];

    extraConfig = ''
      # Terminal & Input behavior
      set -s extended-keys on
      set -a terminal-features "*:RGB"
      set -sa terminal-features '*:extkeys'
      set -ga update-environment TERM
      set -g default-terminal "tmux-256color"
      set -g allow-passthrough on
      set -g mouse on
      set -g renumber-windows on

      # UI / Status Bar
      set -g status-position top
      set -g status-justify absolute-centre
      set -g status-style "bg=default"
      set -g message-style "bg=default"
      set -g message-command-style "bg=default"
      set -g status-right ""
      set -g status-left "#{?client_prefix,#[fg=yellow bold] PFX ,}"
      set -g window-status-format ' #I:#W '
      set -g window-status-current-format '#[fg=blue bg=default bold] #I:#W '

      # Split Panes (using backslash for vertical)
      unbind %
      bind \\ split-window -h -c "#{pane_current_path}"
      unbind '"'
      bind - split-window -v -c "#{pane_current_path}"

      # Config Reload & Toggle Status
      unbind r
      bind r source-file /etc/tmux.conf
      bind b set -g status

      # Pane Resizing
      bind -r j resize-pane -D 5
      bind -r k resize-pane -U 5
      bind -r l resize-pane -R 5
      bind -r h resize-pane -L 5
      bind -r m resize-pane -Z

      # Alt+Number to switch windows
      bind-key -n M-1 select-window -t 1
      bind-key -n M-2 select-window -t 2
      bind-key -n M-3 select-window -t 3
      bind-key -n M-4 select-window -t 4
      bind-key -n M-5 select-window -t 5
      bind-key -n M-6 select-window -t 6
      bind-key -n M-7 select-window -t 7
      bind-key -n M-8 select-window -t 8
      bind-key -n M-9 select-window -t 9
      bind-key -n M-n select-window -n
      bind-key -n M-p select-window -p

      # Kill Pane
      bind-key x kill-pane

      # Copy Mode (vi-style)
      bind-key -T copy-mode-vi 'v' send -X begin-selection
      bind-key -T copy-mode-vi 'y' send -X copy-selection 
      unbind -T copy-mode-vi MouseDragEnd1Pane 

      # Plugin Settings
      set -g @resurrect-capture-pane-contents 'on' 
      set -g @continuum-restore 'on' 
    '';
  };

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
    nerd-fonts.jetbrains-mono
  ];
}
