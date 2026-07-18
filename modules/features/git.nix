{

  flake.nixosModules.git = { pkgs, ... }: {
    programs.git = {
      enable = true;
      config = {
        user.name = "g-melika";
        user.email = "georgenaiem1@gmail.com";
        init.defaultBranch = "master";
      };
    };
    environment.systemPackages = [ pkgs.lazygit ];
  };
}
