{inputs, ...}: {
  imports = [
    ./helix.nix

    inputs.niri-nix.homeModules.default

    ./niri

    ./mangowm.nix
  ];
}
