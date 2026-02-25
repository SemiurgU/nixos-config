{inputs, ...}: {
  imports = [
    ./helix.nix

    ./niri.nix

    inputs.mango.hmModules.mango
    ./mango.nix
  ];
}
