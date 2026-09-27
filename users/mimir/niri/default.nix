{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./misc.nix
    ./binds.nix
    ./env.nix
    ./layout.nix
    ./rules.nix
  ];

  wayland.windowManager.niri = {
    enable = true;
    settings = {
      _children = [
        {spawn-at-startup._args = ["xwayland-satellite"];}
        {spawn-at-startup._args = ["oniri" "-T" "-R"];}
      ];
    };
  };

  home.packages = with pkgs; [
    xwayland-satellite
    kitty
    nautilus
    wooz
    inputs.oniri.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
