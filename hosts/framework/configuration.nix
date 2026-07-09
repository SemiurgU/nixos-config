{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./disko-framework.nix
    ../../module
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    tmp.cleanOnBoot = true;
    tmp.useTmpfs = true;
    kernelPackages = pkgs.linuxPackages_latest;
  };
  virtualisation.libvirtd.enable = true;
  security.rtkit.enable = true;
  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver
        intel-vaapi-driver
      ];
    };
    enableRedistributableFirmware = true;
    fw-fanctrl.enable = true;
    bluetooth.enable = true;
    bluetooth.powerOnBoot = false;
    sensor.iio.enable = true;
  };

  programs = {
    appimage.enable = true;
    appimage.binfmt = true;
    gamemode.enable = true;
    gamemode.enableRenice = true;
    niri = {
      enable = true;
      package = pkgs.niri;
    };
    firefox.enable = true;
    virt-manager.enable = true;
  };
  services = {
    upower.enable = true;
    power-profiles-daemon.enable = true;

    btrfs.autoScrub = {
      enable = true;
      fileSystems = ["/"];
      interval = "monthly";
    };

    thermald.enable = true;
    xserver = {
      enable = true;
      xkb = {
        layout = "gb,ua";
        variant = ",phonetic";
        options = "grp:alt_shift_toggle";
      };
      excludePackages = [pkgs.xterm];
    };

    displayManager.dms-greeter = {
      enable = true;
      compositor = {
        name = "niri";
      };

      configHome = "/home/mimir";

      logs = {
        save = true;
        path = "/tmp/dms-greeter.log";
      };
    };

    gvfs.enable = true;
    printing.enable = true;

    pipewire = {
      enable = true;
      jack.enable = true;
      pulse.enable = true;
    };

    libinput.enable = true;

    openssh.enable = true;
    tailscale.enable = true;
    flatpak.enable = true;
  };

  zramSwap.enable = true;
  powerManagement.powertop.enable = true;
  networking = {
    hostName = "framework";
    networkmanager.enable = true;
    networkmanager.wifi.powersave = true;
  };

  time.timeZone = "Europe/Rome";

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
      "audio"
      "libvirtd"
    ];
  };

  system.stateVersion = "25.11";
}
