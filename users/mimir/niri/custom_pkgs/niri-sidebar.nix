{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
}: let
  pname = "niri-sidebar";
  version = "0.4.0";
in
  rustPlatform.buildRustPackage {
    inherit pname version;

    src = fetchFromGitHub {
      owner = "Vigintillionn";
      repo = pname;
      rev = "v${version}";
      hash = "sha256-MYP1ZiwV9+yJhl0zpuri6NQkQHlaYZjGBhXpZEaPZyI=";
    };

    cargoHash = "sha256-zZlfwAxWE1ZZy6k7QoBOamCGigGShd89sD27vfvgR00=";

    nativeBuildInputs = [
      pkg-config
    ];

    meta = {
      description = "A lightweight, external sidebar manager for the Niri window manager";
      homepage = "https://github.com/Vigintillionn/niri-sidebar";
      license = lib.licenses.gpl3Only;
      mainProgram = pname;
      platforms = lib.platforms.linux;
    };
  }
