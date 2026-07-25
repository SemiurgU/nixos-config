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

    ./mangowm.nix
  ];

  programs.nh = {
    enable = true;
    flake = "/home/mimir/.config/nixos";
  };
  services.nix-serve.enable = true;
  environment.systemPackages = [
    pkgs.kdePackages.kimageformats
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
  ];
}
