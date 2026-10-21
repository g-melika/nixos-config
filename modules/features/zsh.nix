let
  dotfiles = {
    hjem.users.gmelika.files = {
      ".zshrc".source = ../../dots/.zshrc;
      ".config/starship.toml".source = ../../dots/.config/starship.toml;
    };
  };
in
{
  flake.nixosModules.zsh = { pkgs, ... }: {
    imports = [ dotfiles ];

    users.defaultUserShell = pkgs.zsh;
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
    };
    programs.starship.enable = true;
    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

  };
  flake.darwinModules.zsh = { pkgs, ... }: {
    imports = [ dotfiles ];
    environment.shells = [ pkgs.zsh ];
    users.users.gmelika.shell = pkgs.zsh;
    environment.systemPackages = with pkgs; [ starship zoxide direnv ];
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      promptInit = "";
    };
    hjem.users.gmelika.files.".config/zsh/macos.zsh".source =
      pkgs.replaceVars ../../dots/.config/zsh/macos.zsh {
        autosuggestions = pkgs.zsh-autosuggestions;
        syntaxHighlighting = pkgs.zsh-syntax-highlighting;
        inherit (pkgs) starship zoxide direnv;
      };
  };
}
