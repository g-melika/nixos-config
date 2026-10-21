{ inputs, ... }:
let
  emacs = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      (writeShellScriptBin "doom" ''
        exec "$HOME/.config/emacs/bin/doom" "$@"
      '')
      (if stdenv.hostPlatform.isDarwin then pkgs.emacs else emacs-pgtk)
      emacs-lsp-booster
      (aspellWithDicts (dicts: [ dicts.en ]))
      git
      ripgrep
      fd
      cmake
      coreutils
      findutils
      (if stdenv.hostPlatform.isDarwin then clang else gcc)
      gnumake
      gnutar
      gnutls
      gzip
      libtool
      pkg-config
      sqlite
      unzip
    ];
    hjem.users.gmelika.files.".config/doom" = {
      source = inputs.emacs-config;
      clobber = true;
    };
  };
in
{
  flake.nixosModules.emacs = { pkgs, ... }:
    {
      imports = [ emacs ];
      services.emacs = {
        enable = true;
        package = pkgs.emacs-pgtk;
        install = true;
        defaultEditor = true;
      };

      environment.sessionVariables.VISUAL = "emacseditor";
      xdg.mime.defaultApplications."text/*" = "emacsclient.desktop";
    };
  flake.darwinModules.emacs = { pkgs, ... }: {
    imports = [ emacs ];
    services.emacs = {
      enable = true;
      package = pkgs.emacs;
      additionalPath = [ "/Users/gmelika/.config/emacs/bin" ];
    };
    environment.variables = {
      EDITOR = "emacsclient -t";
      VISUAL = "emacseditor";
    };
    environment.systemPackages = [
      (pkgs.writeShellScriptBin "emacseditor" ''
        exec ${pkgs.emacs}/bin/emacsclient --create-frame --alternate-editor= "$@"
      '')
    ];
  };
}
