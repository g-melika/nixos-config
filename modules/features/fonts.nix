let
  fonts = { pkgs, ... }: {
    fonts = {
      packages = with pkgs; [
        maple-mono.NF-unhinted
        maple-mono.Normal-TTF
        work-sans
        comic-neue
        source-sans
        symbola
        comfortaa
        inter
        lato
        lexend
        jost
        dejavu_fonts
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-color-emoji
        nerd-fonts.fira-code
        nerd-fonts.meslo-lg
        openmoji-color
        twemoji-color-font
        nerd-fonts.symbols-only
      ];
    };
  };
in
{
  flake.nixosModules.fonts = {
    imports = [ fonts ];
    fonts.enableDefaultPackages = false;
  };
  flake.darwinModules.fonts = fonts;
}
