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
  ];

  programs.nh = {
    enable = true;
    flake = user.flakePath;
  };

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
  ];
}
