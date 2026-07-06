{ inputs, ... }: {
  flake.nixosModules.greetd = { pkgs, ... }: {
    imports = [
      inputs.noctalia-greeter.nixosModules.default
    ];

    programs.noctalia-greeter = {
      enable = true;
      package = inputs.noctalia-greeter.packages.${pkgs.stdenv.hostPlatform.system}.default;
      settings = {
        session.default = "Niri";
        user.default = "gmelika";
        keyboard.layout = "us";
        cursor = {
          theme = "Bibata-Modern-Ice";
          size = 24;
          path = "/run/current-system/sw/share/icons";
        };
        auth.allow_empty_password = true;
      };
    };

  };
}
