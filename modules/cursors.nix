{pkgs, inputs, ... }: 

{
  environment.systemPackages = with pkgs; [
    bibata-cursors-translucent
  ];
}
