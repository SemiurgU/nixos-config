{
  inputs,
  pkgs,
  user,
  ...
}
: {
  imports = [
    inputs.dms-plugin-registry.nixosModules.default
  ];

  services = {
    displayManager = {
      defaultSession = "niri";
      autoLogin = {
        enable = true;
        user = "${user.username}";
      };
      dux-greeter = {
        enable = true;
        compositor.name = "niri";
        configHome = "/home/${user.username}";
        logs = {
          save = true;
          path = "/tmp/dux-greeter.log";
        };
      };
    };
  };

  programs.dux-search.enable = true;
  programs.dux-search.systemd.enable = true;

  programs.dux-shell = {
    enable = true;
    systemd.enable = true;
    plugins = {
      dankKDEConnect.enable = true;
      batteryPlus.enable = true;
      nixPackageRunner.enable = true;
      webSearch.enable = true;
      wallpaperCarousel.enable = true;
      dankscale.enable = true;
    };
  };
  environment.systemPackages = with pkgs; [
    upower # batteryPlus
    jq # NixPackageRunner
    wl-clipboard # NixPackageRunner
    tailscale # dmsDankscale
  ];
}
