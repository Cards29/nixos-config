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
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, niri, zen-browser, ... }@inputs: {
    nixosConfigurations = {

      # Change "nixos" to your actual hostname
      "nixos" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";   # Change only if you're on ARM (like Raspberry Pi)

        specialArgs = { inherit inputs home-manager niri; };

        modules = [
          ./configuration.nix
          ./hardware-configuration.nix
        ];
      };
    };
  };
}
