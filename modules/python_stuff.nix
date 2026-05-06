{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    uv
    steam-run
  ];
}
