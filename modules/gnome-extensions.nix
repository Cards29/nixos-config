{pkgs, inputs, ... }: 

{
  environment.systemPackages = with pkgs; [
    gnomeExtensions.blur-my-shell
    gnomeExtensions.tweaks-in-system-menu
  ];
}
