{pkgs, inputs, ... }: 

{
  environment.systemPackages = with pkgs; [
    (texlive.combine {
      inherit (texlive)
        scheme-medium   # Essential base
        latexmk         # Required for Neovim/VimTeX automation
        biber           # Modern bibliography backend
        biblatex        # Better citation management
        amsmath         # Non-negotiable for CS/Math formulas
        hyperref        # Makes your PDF links/ToC clickable
        geometry        # Easiest way to set margins (usually required by Uni)
        enumitem;       # Better control over bullet points/lists
    })
  ];
}
