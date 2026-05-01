{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    gnomeExtensions.all-in-one-clipboard
    gnomeExtensions.caffeine
    gnomeExtensions.blur-my-shell
    gnomeExtensions.tweaks-in-system-menu
  ];
}
