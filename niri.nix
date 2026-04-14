{ pkgs, niri, ... }: {
  # 1. Import the NixOS module provided by the flake
  imports = [ niri.nixosModules.niri ];
  nixpkgs.overlays = [ niri.overlays.niri ];


  # 2. Enable niri
  programs.niri.enable = true;

  # 3. Optional: Use the absolute latest "unstable" version from the flake
  # If you don't set this, it defaults to the stable version in the flake.
  programs.niri.package = pkgs.niri-unstable; 

  # The sodiboo module automatically handles:
  # - Polkit (KDE agent by default)
  # - GNOME Keyring
  # - XDG Desktop Portals (required for screen sharing)
  # - PAM entry for swaylock
}
