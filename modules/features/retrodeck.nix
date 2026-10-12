{ inputs, ... }:
{
  flake.nixosModules.retrodeck = { ... }: {
    imports = [
      inputs.nix-flatpak.nixosModules.nix-flatpak
    ];

    services.flatpak = {
      enable = true;
      packages = [
        "net.retrodeck.retrodeck"
      ];
    };
  };
}
