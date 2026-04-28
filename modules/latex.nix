{pkgs, inputs, ... }: 

{
  environment.systemPackages = with pkgs; [
    (texlive.combine {
      inherit (texlive)
        scheme-medium   # good base (NOT full, NOT tiny)
        latexmk         # build tool (important)
        biber           # bibliography (modern, better than bibtex)
        biblatex
        csquotes
        geometry
        hyperref
        xcolor
        graphicx
        amsmath
        amssymb
        fontspec        # if using XeLaTeX/LuaLaTeX
        titlesec
        fancyhdr
        enumitem;
    })
  ];
}
