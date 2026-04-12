{
  description = "My NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }: {
    nixosConfigurations = {

      # Change "nixos" to your actual hostname
      "nixos" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";   # Change only if you're on ARM (like Raspberry Pi)

        modules = [
          ./configuration.nix
          ./hardware-configuration.nix
        ];
      };
    };
  };
}
