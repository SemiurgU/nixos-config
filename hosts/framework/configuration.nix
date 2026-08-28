{
  inputs,
  user,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./disko-framework.nix
    ../../module
    inputs.win98se-plymouth.nixosModules.default
    inputs.nix-index-database.nixosModules.default
  ];

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    trusted-users = ["root" user.username];
  };

  boot = {
    plymouth = {
      enable = true;
      win98se.label.mode = "none";
    };

    consoleLogLevel = 3;
    initrd = {
      kernelModules = ["i915"];
      verbose = false;
    };

    loader.timeout = 0;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    tmp.cleanOnBoot = true;
    tmp.useTmpfs = true;
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "mem_sleep_default=deep"
      "quiet"
      "rd.udev.log_level=3"
      "rd.systemd.show_status=auto"
    ];

    kernel.sysctl."vm.swappiness" = 1;
  };

  systemd.services.display-manager = {
    after = ["plymouth-quit-wait.service"];
    wants = ["plymouth-quit-wait.service"];
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
    niri = {
      enable = true;
      package = inputs.niri-git.packages.${pkgs.stdenv.hostPlatform.system}.default;
    };
    firefox.enable = true;
    virt-manager.enable = true;
    kdeconnect.enable = true;
    nix-index-database.comma.enable = true;
    nix-index.package = inputs.nix-index-database.packages.${pkgs.stdenv.hostPlatform.system}.nix-index-with-small-db;
  };
  services = {
    upower.enable = true;
    power-profiles-daemon.enable = true;
    framework-control.enable = true;

    fwupd.enable = true;
    btrfs.autoScrub = {
      enable = true;
      fileSystems = ["/"];
      interval = "monthly";
    };

    thermald.enable = true;

    displayManager.dms-greeter = {
      enable = true;
      compositor = {
        name = "niri";
      };

      configHome = "/home/${user.username}";

      logs = {
        save = true;
        path = "/tmp/dms-greeter.log";
      };
    };

    gvfs.enable = true;

    pipewire = {
      enable = true;
      jack.enable = true;
      pulse.enable = true;
    };

    libinput.enable = true;
    ratbagd.enable = true;

    openssh.enable = true;
    tailscale.enable = true;
    flatpak.enable = true;
  };

  zramSwap = {
    enable = true;
    memoryPercent = 25;
  };
  powerManagement.powertop.enable = true;
  networking = {
    hostName = "framework";
    networkmanager.enable = true;
    networkmanager.wifi.powersave = true;
  };

  time.timeZone = "Europe/Rome";

  environment.systemPackages = [
    pkgs.qemu
    pkgs.btrfs-assistant
  ];

  users.users.${user.username} = {
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
