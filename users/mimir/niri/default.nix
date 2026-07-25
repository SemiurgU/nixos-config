{pkgs, ...}: {
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
      spawn-at-startup = [
        ["xwayland-satellite"]
        ["${pkgs.callPackage ./custom_pkgs/oniri.nix {}}/bin/oniri" "-T" "-R"]
      ];

      include = [
        ["/home/mimir/.config/niri/dms/colors.kdl"]
        ["/home/mimir/.config/niri/dms/alttab.kdl"]
        ["/home/mimir/.config/niri/dms/cursor.kdl"]
        ["/home/mimir/.config/niri/dms/wpblur.kdl"]
        ["/home/mimir/.config/niri/dms/outputs.kdl"]
        ["/home/mimir/.config/niri/dms/layout.kdl"]
        ["/home/mimir/.config/niri/dms/windowrules.kdl"]
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
  ];
}
