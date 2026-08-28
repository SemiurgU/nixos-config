{lib, ...}: {
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "steam"
      "steam-unwrapped"
    ];
  programs.gamemode.enable = true;
  programs.gamemode.enableRenice = true;

  programs.gamescope.enable = true;
  programs.gamescope.enableWsi = true;
  programs.gamescope.capSysNice = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
  };
}
