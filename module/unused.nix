{pkgs, ...}: {
  services.desktopManager.cosmic.enable = false;
  services.desktopManager.plasma6.enable = false;
  services.desktopManager.gnome.enable = false;
  services.gnome = {
    core-apps.enable = false;
    core-developer-tools.enable = false;
    games.enable = false;
  };
  environment.gnome.excludePackages = [pkgs.gnome-tour pkgs.gnome-user-docs];
  programs.mangowc.enable = false;
  programs.hyprland.enable = false;
}
