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

    ./kde.nix

    ./gnome.nix
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

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
  ];
}
