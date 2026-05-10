{
  config,
  pkgs,
  inputs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    (texlive.combine {
      inherit (texlive)
        scheme-small
        latexmk
        biber
        biblatex
        ;
    })

    tex-fmt
  ];
}
