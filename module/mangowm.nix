{
  inputs,
  pkgs,
  ...
}: {
  programs.mangowc = {
    enable = true;
    package = pkgs.mango;
  };
}
