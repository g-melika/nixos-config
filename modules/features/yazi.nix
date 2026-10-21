let
  yazi = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      pkgs.yazi
      ffmpegthumbnailer
      unrar
      jq
      poppler
      fd
      ripgrep
      zoxide
    ];

    programs.zsh.shellInit = builtins.readFile ../../dots/.config/zsh/yazi.zsh;

    hjem.users.gmelika.files.".config/yazi".source = ../../dots/.config/yazi;
  };
in
{
  flake.nixosModules.yazi = yazi;
  flake.darwinModules.yazi = yazi;
}
