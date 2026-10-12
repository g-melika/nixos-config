{ inputs, ... }:
{
  flake.nixosModules.jovianSteam = { lib, ... }: {
    imports = [
      inputs.jovian.nixosModules.default
    ];

    nixpkgs.config.permittedInsecurePackages = [ "pnpm-9.15.9" ];

    jovian = {
      steam = {
        enable = true;
        autoStart = lib.mkDefault true;
        desktopSession = "niri";
        user = "gmelika";
      };

      steamos.useSteamOSConfig = lib.mkDefault true;

      hardware.has.amd.gpu = true;

      decky-loader.enable = true;
    };

  };
}
