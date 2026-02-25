{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nvf.nixosModules.default
    ./nvf.nix

    ./dms.nix

    ./steam.nix
  ];

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/mimir/.config/nixos";
  };

  environment.systemPackages = [
    pkgs.kdePackages.kimageformats
  ];

  environment.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt6ct";
    QT_QPA_PLATFORM = "wayland";
  };

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
  ];
}
