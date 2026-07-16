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
        (writeShellScriptBin "doom-emacsclient" ''
          exec ${emacs-pgtk}/bin/emacsclient -c "$@"
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
        ".config/doom/config.el".source = ../../dots/.config/doom/config.el;
        ".config/doom/init.el".source = ../../dots/.config/doom/init.el;
        ".config/doom/packages.el".source = ../../dots/.config/doom/packages.el;
        ".config/doom/themes/doom-gruvbox-material-theme.el".source = ../../dots/.config/doom/themes/doom-gruvbox-material-theme.el;
      };
    };
}
