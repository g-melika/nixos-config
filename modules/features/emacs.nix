{ inputs, ... }:
{
  flake.nixosModules.emacs = { pkgs, ... }:
    {
      services.emacs = {
        enable = true;
        package = pkgs.emacs-pgtk;
        install = true;
        defaultEditor = false;
      };

      environment.systemPackages = with pkgs; [
        (writeShellScriptBin "doom" ''
          exec "$HOME/.config/emacs/bin/doom" "$@"
        '')

        emacs-pgtk
        emacs-lsp-booster
        git
        ripgrep
        fd

        cmake
        coreutils
        findutils
        gcc
        gnumake
        gnutar
        gnutls
        gzip
        libtool
        pkg-config
        sqlite
        unzip
      ];

      hjem.users.gmelika.files = {
        ".config/doom" = {
          source = inputs.emacs-config;
          clobber = true;
        };
      };
    };
}
