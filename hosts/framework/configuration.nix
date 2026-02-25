{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./disko-framework.nix
    ../../module
    inputs.niri.nixosModules.niri
    inputs.mango.nixosModules.mango
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    tmp.cleanOnBoot = true;
    tmp.useTmpfs = true;
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = ["mem_sleep_default=deep"];
  };

  hardware = {
    enableRedistributableFirmware = true;
    fw-fanctrl.enable = true;
    bluetooth.enable = true;
    bluetooth.powerOnBoot = false;
  };

  programs = {
    gamemode.enable = true;
    gamemode.enableRenice = true;
    niri = {
      enable = true;
      package = pkgs.niri;
    };
    mango.enable = true;
    firefox.enable = true;
  };

  services = {
    btrfs.autoScrub.enable = true;
    btrfs.autoScrub.interval = "monthly";
    system76-scheduler.enable = true;
    system76-scheduler.useStockConfig = true;
    thermald.enable = true;
    xserver = {
      enable = true;
      xkb.layout = "gb,ua";
      xkb.variant = ",phonetic";
      xkb.options = "grp:alt_shift_toggle";
      excludePackages = [pkgs.xterm];
    };
    displayManager = {
      sddm.enable = true;
      sddm.wayland.enable = true;
    };
    desktopManager.plasma6.enable = true;
    gvfs.enable = true;
    printing.enable = true;

    pipewire = {
      enable = true;
      pulse.enable = true;
    };

    libinput.enable = true;

    openssh.enable = true;
    tailscale.enable = true;
    flatpak.enable = true;
  };
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu.swtpm.enable = true;
    };
  };

  zramSwap.enable = true;
  powerManagement.powertop.enable = true;
  networking = {
    hostName = "framework";
    networkmanager.enable = true;
    networkmanager.wifi.powersave = true;
  };

  time.timeZone = "Europe/Rome";
  niri-flake.cache.enable = false;

  environment.systemPackages = [
    pkgs.qemu
    pkgs.quickemu
    pkgs.btrfs-assistant
  ];

  users.users.mimir = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "input"
      "video"
      "libvirtd"
    ]; # Enable ‘sudo’ for the user.
  };

  system.stateVersion = "25.11"; # Did you read the comment?
}
