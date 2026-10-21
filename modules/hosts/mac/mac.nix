{ inputs, self, ... }: {
  flake.darwinConfigurations.mac = inputs.nix-darwin.lib.darwinSystem {
    modules = with self.darwinModules; [ mac ];
  };

  flake.darwinModules.mac = {
    imports = with self.darwinModules; [
      macCore
      hjem
      fonts
      git
      kitty
      zsh
      emacs
      helix
      yazi
      aseprite
      macKeyboard
      androidStudio
    ];

    nixpkgs.hostPlatform = "aarch64-darwin";
    nixpkgs.config.allowUnfree = true;
    system.primaryUser = "gmelika";
    users.users.gmelika = {
      name = "gmelika";
      home = "/Users/gmelika";
      description = "George Melika";
    };
    hjem.users.gmelika = {
      user = "gmelika";
      directory = "/Users/gmelika";
    };

    homebrew = {
      enable = true;
      casks = [ "firefox" "slack" "android-studio" "karabiner-elements" ];
      # Existing manually installed applications are not removed on rebuild.
      onActivation.cleanup = "none";
      onActivation.autoUpdate = false;
      onActivation.upgrade = false;
    };

    # Initial nix-darwin compatibility version; do not advance on upgrades.
    system.stateVersion = 6;
  };
}
