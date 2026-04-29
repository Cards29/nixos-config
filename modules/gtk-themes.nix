{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    adw-gtk3
  ];
}
