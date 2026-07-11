{
  flake.nixosModules.wacom = { pkgs, ... }: {
    hardware.opentabletdriver = {
      enable = true;
      daemon.enable = true;
    };

    environment.systemPackages = [ pkgs.libwacom pkgs.opentabletdriver ];
  };
}
