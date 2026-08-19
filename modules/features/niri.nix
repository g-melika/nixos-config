{
  flake.nixosModules.niri = { pkgs, ... }: {

    environment.systemPackages = with pkgs; [
      wl-clipboard
      wtype
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
      xwayland-satellite
      udiskie

      grim
      slurp
      swappy
      wf-recorder
      brightnessctl
      warpd

      adw-gtk3
      gnome-themes-extra
      papirus-icon-theme
      bibata-cursors
      playerctl

      imv
      mpv
    ];

    programs.niri.enable = true;
    services.udisks2.enable = true;
    security = {
      polkit.enable = true;
      pam.services.greetd.enableGnomeKeyring = true;
    };
    services.gnome.gnome-keyring.enable = true;

    xdg.portal = {
      enable = true;

      config.common.default = [
        "gtk"
        "gnome"
      ];
    };

    xdg.mime.defaultApplications = {
      "image/*" = "imv.desktop";
      "video/*" = "mpv.desktop";
    };

    programs.dconf.enable = true;

    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };

    hjem.users.gmelika = {
      files = {
        ".config/niri/config.kdl".source = ../../dots/.config/niri/config.kdl;
      };
    };

  };
}
