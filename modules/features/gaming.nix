{ self, ... }:
{
  flake.nixosModules.gaming = { pkgs, ... }: {
    imports = with self.nixosModules; [
      jovianSteam
      retrodeck
    ];

    environment.systemPackages = with pkgs; [
      protonplus
      prismlauncher
    ];

    networking.firewall = {
      enable = true;
      allowedTCPPorts = [ 4000 ];
      allowedUDPPorts = [ 4000 ];
    };
  };
}
