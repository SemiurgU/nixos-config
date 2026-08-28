{pkgs, ...}: {
  programs.mangowc = {
    enable = false;
    package = pkgs.mango;
  };
}
