{pkgs, configs, inputs, ... }: 

{
  programs.dms-shell = {
    enable = true;
    quickshell.package = inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.quickshell;

    systemd = {
      enable = true;             # Systemd service for auto-start
      restartIfChanged = true;   # Auto-restart dms.service when dms-shell changes
    };
    
    # Core features
    enableSystemMonitoring = true;     # System monitoring widgets (dgop)
    enableVPN = true;                  # VPN management widget
    enableDynamicTheming = true;       # Wallpaper-based theming (matugen)
    enableAudioWavelength = true;      # Audio visualizer (cava)
    enableCalendarEvents = true;       # Calendar integration (khal)
    enableClipboardPaste = true;       # Pasting from the clipboard history (wtype)

    plugins = {
      # Simply enable plugins by their ID (from the registry)
      dankBatteryAlerts.enable = true;
      dockerManager.enable = true;
      wallpaperCarousel.enable = true;
      dankGifSearch.enable = true;
      dankPomodoroTimer.enable = true;
      dankLauncherKeys.enable = true;
      dankNotepadModule.enable = true;
      calculator.enable = true;
      catWidget.enable = true;
      fullscreenPowerMenu.enable = true;
      dankAudioVisualizer.enable = true;
      discordVoice.enable = true;
      emojiLauncher.enable = true;
      webSearch.enable = true;
      sshMonitor.enable = true;
      nixMonitor.enable = true;
      asusControlCenter.enable = true;
      commandRunner.enable = true;
      dankBitwarden.enable = true;
      gitmojiLauncher.enable = true;
    };
  };

}
