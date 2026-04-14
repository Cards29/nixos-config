{
  description = "My favourite NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # niri.url = "github:YaLTeR/niri";
    niri.url = "github:sodiboo/niri-flake";
  };

  outputs = { self, nixpkgs, home-manager, niri, ... }: {
    nixosConfigurations = {

      # Change "nixos" to your actual hostname
      "nixos" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";   # Change only if you're on ARM (like Raspberry Pi)

        specialArgs = { inherit home-manager niri; };

        modules = [
          ./configuration.nix
          ./hardware-configuration.nix
        ];
      };
    };
  };
}
