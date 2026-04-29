{ pkgs, inputs, ... }:

{
  environment.systemPackages = [
    inputs.skwd-wall.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
