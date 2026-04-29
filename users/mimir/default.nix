{inputs, ...}: {
  imports = [
    ./helix.nix

    inputs.niri-nix.homeModules.default
    ./niri.nix
  ];
}
