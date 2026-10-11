{pkgs, ...}
: {
  programs.dsearch.enable = true;
  programs.dsearch.systemd.enable = true;
  programs.dms-shell = {
    enable = true;
    systemd.enable = true;
    enableAudioWavelength = true;
    enableCalendarEvents = true;
    enableDynamicTheming = true;
    enableVPN = true;

    plugins = {
      dankKDEConnect = {
        enable = true;
        src = "${pkgs.fetchFromGitHub {
          owner = "AvengeMedia";
          repo = "dms-plugins";
          rev = "a8a508bc371e7c3f2c7862d8840b88cf5c63978f";
          hash = "sha256-3nHfkGzmmq8JpN7bmO8Z5zIumvx8dzwS1GtQ6V0XgMg=";
        }}/DankKDEConnect";
      };
      batteryPlus = {
        enable = true;
        src = pkgs.fetchFromGitHub {
          owner = "arcatva";
          repo = "dms-battery-plus";
          rev = "4e653d09174e1edc260f279c42ec2477b6fb2e24";
          sha256 = "sha256-XEAvnTisFTPs55+uVCDeHXSJthtkE0CU6No29TDyAYY=";
        };
      };
      NixPackageRunner = {
        enable = true;
        src = pkgs.fetchFromGitHub {
          owner = "iahccc";
          repo = "NixPackageRunner";
          rev = "829ad93c15b7c0ec82a6d7483728029037442601";
          sha256 = "sha256-ur+1oN+QmTu7p5ZMpL3rCd4JGYbkerko4twa+tH6uvg=";
        };
      };
      WebSearch = {
        enable = true;
        src = pkgs.fetchFromGitHub {
          owner = "devnullvoid";
          repo = "dms-web-search";
          rev = "821f5b437ea96739ce1cbc85ce324fb55e8884bb";
          sha256 = "sha256-UqFgAjW2A75dtlvOZkq4Vv/v/DROoc/ouCXBaVlksPI=";
        };
      };
      wallpaperCarousel = {
        enable = true;
        src = pkgs.fetchFromGitHub {
          owner = "motor-dev";
          repo = "wallpaperCarousel";
          rev = "761ecd1b7f347beee9f17909f8334d987c935a1a";
          sha256 = "sha256-/LoehTfSeeqkgIXw46Ll/PrxeEDhg4RZI5BXib6yEnI=";
        };
      };
      dmsDankscale = {
        enable = true;
        src = pkgs.fetchFromGitHub {
          owner = "dwright134";
          repo = "dms-dankscale";
          rev = "bddebf0e2935ba23b0614ff9af5bf8f4ed6d3d9f";
          sha256 = "sha256-o5kcFV7VAmHJqsKgnjDuuryubnuI9U+GQIPOlENZ5ao=";
        };
      };
    };
  };
  environment.systemPackages = with pkgs; [
    upower # batteryPlus
    jq # NixPackageRunner
    wl-clipboard # NixPackageRunner
    tailscale # dmsDankscale
  ];
}
