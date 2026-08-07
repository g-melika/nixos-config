{ config, pkgs, ... }:
{
  flake.nixosModules.helix = { pkgs, ... }: {
    environment.systemPackages = [ pkgs.helix ];

    hjem.users.gmelika.files = {
      ".config/helix/config.toml".source = ../../dots/.config/helix/config.toml;
      ".config/helix/languages.toml".source = ../../dots/.config/helix/languages.toml;
    };
  };
}
