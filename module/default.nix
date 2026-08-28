{
  inputs,
  user,
  pkgs,
  ...
}: {
  imports = [
    inputs.nvf.nixosModules.default
    ./nvf.nix
    ./dms.nix
    ./steam.nix
    ./unused.nix
  ];

  programs.nh = {
    enable = true;
    flake = user.flakePath;
  };
  environment.systemPackages = [
    pkgs.kdePackages.kimageformats
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
  ];
}
