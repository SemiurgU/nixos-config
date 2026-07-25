{pkgs, ...}: {
  services = {
    desktopManager.gnome.enable = false;
    gnome = {
      core-apps.enable = false;
      core-developer-tools.enable = false;
      games.enable = false;
    };
  };
  environment.gnome.excludePackages = [pkgs.gnome-tour pkgs.gnome-user-docs];
}
