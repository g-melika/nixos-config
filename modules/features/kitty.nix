let
  kitty = { pkgs, ... }: {

    environment.systemPackages = [ pkgs.kitty ];

    hjem.users.gmelika = {
      files = {
        ".config/kitty/kitty.conf".source = ../../dots/.config/kitty/kitty.conf;

        ".config/kitty/current-theme.conf".source = ../../dots/.config/kitty/current-theme.conf;
      };
    };

  };
in
{
  flake.nixosModules.kitty = kitty;
  flake.darwinModules.kitty = {
    imports = [ kitty ];
    hjem.users.gmelika.files.".config/kitty/macos.conf".source = ../../dots/.config/kitty/macos.conf;
  };
}
