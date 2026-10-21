{
  flake.darwinModules.macKeyboard = {
    hjem.users.gmelika.files.".config/karabiner/karabiner.json" = {
      type = "copy";
      source = ../../dots/.config/karabiner/karabiner.json;
    };
  };
}
