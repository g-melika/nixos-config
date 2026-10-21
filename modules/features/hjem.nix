{ inputs, ... }: {
  flake.nixosModules.hjem = inputs.hjem.nixosModules.default;
  flake.darwinModules.hjem = inputs.hjem.darwinModules.default;
}
