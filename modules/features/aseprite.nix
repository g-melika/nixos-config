let
  aseprite = { pkgs, ... }: {
    environment.systemPackages = [ pkgs.aseprite ];
  };
in
{
  flake.nixosModules.aseprite = aseprite;
  flake.darwinModules.aseprite = aseprite;
}
