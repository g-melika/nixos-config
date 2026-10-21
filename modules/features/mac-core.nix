{
  flake.darwinModules.macCore = { pkgs, ... }: {
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nix.gc = {
      automatic = true;
      interval = { Weekday = 0; Hour = 3; Minute = 0; };
      options = "--delete-older-than 14d";
    };
    nix.optimise = {
      automatic = true;
      interval = [{ Weekday = 0; Hour = 4; Minute = 0; }];
    };
    time.timeZone = "Africa/Cairo";

    environment.systemPackages = with pkgs; [
      nixpkgs-fmt
      nixd
      vim
      curl
      wget
      zip
      unzip
      ripgrep
      jq
      mpv
    ];
    environment.variables = {
      LANG = "en_US.UTF-8";
      XDG_CONFIG_HOME = "/Users/gmelika/.config";
    };

    system.defaults = {
      NSGlobalDomain = {
        AppleInterfaceStyle = "Dark";
        AppleShowAllExtensions = true;
        ApplePressAndHoldEnabled = false;
        InitialKeyRepeat = 15;
        KeyRepeat = 2;
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
      };
      dock = {
        autohide = true;
        show-recents = false;
        mru-spaces = false;
      };
      finder = {
        AppleShowAllFiles = true;
        ShowPathbar = true;
      };
      trackpad = {
        Clicking = true;
      };
      # Input sources are enabled once in System Settings; writing HIToolbox's
      # private numeric layout IDs is not reliable across macOS releases.
    };

    launchd.user.agents.wallpaper.serviceConfig = {
      ProgramArguments = [
        "/usr/bin/osascript"
        "-e"
        ''tell application "System Events" to tell every desktop to set picture to "${../../assets/wallpapers/wallpaper.jpg}"''
      ];
      RunAtLoad = true;
    };
  };
}
