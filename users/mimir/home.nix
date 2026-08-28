{pkgs, ...}: {
  imports = [
    ./theme.nix
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
      extraPackages = [pkgs.exiftool];
    };
    swayimg.enable = true;
    lutris.enable = true;
  };

  home.packages = with pkgs; [
    drawy
    pear-desktop
    amberol
    piper
    gh
    ripgrep
    qbittorrent-enhanced
    prismlauncher
    proton-vpn
    lazygit
    kitty
    nautilus
    networkmanagerapplet
    vesktop
    telegram-desktop
    krita
  ];

  home.stateVersion = "25.11";
}
