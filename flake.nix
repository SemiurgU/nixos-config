{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

    nvf.url = "github:notashelf/nvf";
    nvf.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hardware.url = "github:NixOS/nixos-hardware/master";

    quickshell.url = "github:quickshell-mirror/quickshell";
    quickshell.inputs.nixpkgs.follows = "nixpkgs";

    win98se-plymouth.url = "github:nilp0inter/plymouth-theme-win98se-inspired-nixos-theme";

    oniri.url = "github:Antiz96/oniri";
    oniri.inputs.nixpkgs.follows = "nixpkgs";

    niri-git.url = "github:niri-wm/niri";
  };
  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    hardware,
    ...
  }: let
    user = import ./module/meta.nix;
    system = "x86_64-linux";
  in {
    nixosConfigurations.framework = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {inherit inputs user;};
      modules = [
        ./hosts/framework/configuration.nix
        inputs.disko.nixosModules.disko

        hardware.nixosModules.framework-12th-gen-intel

        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {inherit inputs user;};
            users.${user.username} = ./users/mimir/home.nix;
          };
        }
      ];
    };
  };
}
