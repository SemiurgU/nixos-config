{
  pkgs,
  config,
  ...
}: {
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
    plymouth = {
      enable = true;
      theme = "rings";
      themePackages = with pkgs; [
        # By default we would install all themes
        (adi1090x-plymouth-themes.override {
          selected_themes = ["rings"];
        })
      ];
    };

    # Enable "Silent boot"
    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "udev.log_level=3"
      "systemd.show_status=auto"
      "mem_sleep_default=deep"
    ];
    loader = {
      timeout = 0;
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    tmp.cleanOnBoot = true;
    tmp.useTmpfs = true;
    kernelPackages = pkgs.linuxPackages_latest;
  };
  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver # For Broadwell (2014) or newer processors. LIBVA_DRIVER_NAME=iHD
        intel-vaapi-driver # For older processors. LIBVA_DRIVER_NAME=i965
      ];
    };
    enableRedistributableFirmware = true;
    fw-fanctrl.enable = true;
    bluetooth.enable = true;
    bluetooth.powerOnBoot = false;
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
  };
  services = {
    btrfs.autoScrub.enable = true;
    btrfs.autoScrub.interval = "monthly";
    system76-scheduler.enable = true;
    system76-scheduler.useStockConfig = true;
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
    displayManager = {
      sddm.enable = true;
      sddm.wayland.enable = true;
    };
    desktopManager.plasma6.enable = true;
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
    ]; # Enable ‘sudo’ for the user.
  };

  system.stateVersion = "25.11"; # Did you read the comment?
}
