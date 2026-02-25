{pkgs, ...}: {
  imports = [
    ./default.nix
  ];
  programs = {
    git = {
      enable = true;
      lfs.enable = true;
      settings = {
        user = {
          email = "semiurg1@gmail.com";
          name = "Semiurg";
        };
      };
    };
    kitty = {
      enable = true;
      shellIntegration.enableBashIntegration = true;
      enableGitIntegration = true;
      extraConfig = "
      include dank-tabs.conf
      include dank-theme.conf
        ";
    };
    mpv = {
      enable = true;
      scripts = with pkgs; [
        mpvScripts.thumbfast
        mpvScripts.mpris
        mpvScripts.sponsorblock
      ];
    };
    yazi = {
      enable = true;
    };
  };
  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
    };
  };

  home.packages = with pkgs; [
    (pkgs.callPackage ./pkgs/surge.nix {})
    ripgrep
    prismlauncher
    bat
    blockbench
    lazygit
    bibata-cursors
    xwayland-satellite
    kitty
    nautilus
    btop
    kew
    networkmanagerapplet
    adw-bluetooth
    qt6Packages.qt6ct
    vesktop
    telegram-desktop
  ];

  home.stateVersion = "25.11";
}
