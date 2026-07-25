{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  ...
}:
rustPlatform.buildRustPackage (finalAttrs: {
  pname = "oniri";
  version = "1.3.1";
  rev = "v${finalAttrs.version}";
  __structuredAttrs = true;
  srcHash = "sha256-XQyzoQ/s6ROj+GKwpZM2rZHl9niE/6IWBcE2lgJ8KR8=";
  cargoHash = "sha256-mDS5kyBYjzn31gekqrH8zm2fLzBSFDXODxjGqszoWcE=";

  src = fetchFromGitHub {
    owner = "Antiz96";
    repo = finalAttrs.pname;
    hash = finalAttrs.srcHash;
    inherit (finalAttrs) rev;
  };

  nativeBuildInputs = [
    pkg-config
  ];

  meta = {
    description = "A tool that automatically maximizes the only window of a niri workspace";
    homepage = "https://github.com/Antiz96/oniri";
    license = lib.licenses.gpl3;
    mainProgram = "oniri";
    platforms = lib.platforms.linux;
    maintainers = with lib.maintainers; [
      zaphyra
    ];
  };
})
