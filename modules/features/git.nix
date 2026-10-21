{
  flake.nixosModules.git = { pkgs, ... }: {
    programs.git = {
      enable = true;
      config.include.path = "${../../dots/.gitconfig}";
    };
    environment.systemPackages = [ pkgs.lazygit ];
  };
  flake.darwinModules.git = { pkgs, ... }: {
    environment.systemPackages = [ pkgs.git pkgs.lazygit ];
    hjem.users.gmelika.files.".gitconfig".source = ../../dots/.gitconfig;
  };
}
