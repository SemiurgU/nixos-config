{pkgs, ...}: {
  imports = [
    ./misc.nix
    ./binds.nix
    ./env.nix
    ./layout.nix
    ./rules.nix
    ./niri-dms.nix
  ];

  wayland.windowManager.niri = {
    enable = true;
    settings = {
      _children = [
        {spawn-at-startup._args = ["xwayland-satellite"];}
        {spawn-at-startup._args = ["oniri" "-T" "-R"];}
        {spawn-at-startup._args = ["niri-sidebar" "listen"];}
      ];
    };
  };

  home.packages = with pkgs; [
    xwayland-satellite
    kitty
    nautilus
    btop
    kew
    wooz
    (pkgs.callPackage ./custom_pkgs/oniri.nix {})
    (pkgs.callPackage ./custom_pkgs/niri-sidebar.nix {})
  ];
}
