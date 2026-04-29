{pkgs, ...}: let
  dms = cmd: ["dms" "ipc" "call"] ++ cmd;
in {
  wayland.windowManager.niri = {
    enable = true;
    settings = {
      screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";
      hotkey-overlay = {
        hide-not-bound = [];
        skip-at-startup = [];
      };
      prefer-no-csd = true;

      spawn-at-startup = [
        ["xwayland-satellite"]
        ["nm-applet"]
      ];

      binds = {
        "Mod+Shift+Slash" = {
          _props.repeat = false;
          show-hotkey-overlay = [];
        };
        "Mod+D" = {
          _props.repeat = false;
          spawn = dms ["spotlight" "toggle"];
        };
        "Mod+T" = {
          _props.repeat = false;
          spawn = ["kitty"];
        };
        "Mod+E" = {
          _props.repeat = false;
          spawn = ["nautilus"];
        };
        "Mod+C" = {
          _props.repeat = false;
          spawn = ["adw-bluetooth"];
        };
        "Mod+Shift+B" = {
          _props.repeat = false;
          spawn = ["kitty" "btop"];
        };
        "Mod+Shift+E" = {
          _props.repeat = false;
          quit._props.skip-confirmation = false;
        };
        "Mod+Shift+S" = {
          _props.repeat = false;
          spawn = dms ["niri" "screenshot"];
        };
        "Mod+Ctrl+S" = {
          _props.repeat = false;
          spawn = dms ["niri" "screenshotScreen"];
        };
        "Mod+Alt+S" = {
          _props.repeat = false;
          spawn = dms ["niri" "screenshotWindow"];
        };
        "Mod+O" = {
          _props.repeat = false;
          toggle-overview = [];
        };
        "Mod+Q" = {
          _props.repeat = false;
          close-window = [];
        };
        "Mod+Shift+F" = {
          fullscreen-window = [];
        };
        "Mod+Alt+F" = {
          _props.repeat = false;
          maximize-window-to-edges = [];
        };
        "Mod+L" = {
          _props.repeat = false;
          spawn = dms ["lock" "lock"];
        };
        "Mod+Shift+L" = {
          _props.repeat = false;
          spawn = dms ["inhibit" "toggle"];
        };
        "Mod+F" = {
          _props.repeat = false;
          expand-column-to-available-width = [];
        };
        "Mod+R" = {
          switch-preset-column-width = [];
        };
        "Mod+V" = {
          toggle-window-floating = [];
        };
        "Mod+Z" = {
          _props.repeat = false;
          spawn = ["wooz" "--mouse-track"];
        };

        # focus window
        "Mod+Left".focus-column-left = [];
        "Mod+Right".focus-column-right = [];
        "Mod+Down".focus-window-or-workspace-down = [];
        "Mod+Up".focus-window-or-workspace-up = [];
        # move window
        "Mod+Ctrl+Left".move-column-left = [];
        "Mod+Ctrl+Down".move-window-down-or-to-workspace-down = [];
        "Mod+Ctrl+Up".move-window-up-or-to-workspace-up = [];
        "Mod+Ctrl+Right".move-column-right = [];

        # media keys
        "XF86AudioPlay" = {
          _props = {
            allow-when-locked = true;
            repeat = false;
          };
          spawn = dms ["mpris" "playPause"];
        };
        "XF86AudioPrev" = {
          _props = {
            allow-when-locked = true;
            repeat = false;
          };
          spawn = dms ["mpris" "previous"];
        };
        "XF86AudioNext" = {
          _props = {
            allow-when-locked = true;
            repeat = false;
          };
          spawn = dms ["mpris" "next"];
        };
        "XF86AudioLowerVolume" = {
          _props.allow-when-locked = true;
          spawn = dms ["audio" "decrement" "5"];
        };
        "XF86AudioRaiseVolume" = {
          _props.allow-when-locked = true;
          spawn = dms ["audio" "increment" "5"];
        };
        "XF86AudioMute" = {
          _props.allow-when-locked = true;
          spawn = dms ["audio" "mute"];
        };
        "XF86MonBrightnessUp".spawn = dms ["brightness" "increment" "5" ""];
        "XF86MonBrightnessDown".spawn = dms ["brightness" "decrement" "5" ""];

        # dms stuff
        "Mod+Alt+M" = {
          _props.repeat = false;
          spawn = dms ["theme" "toggle"];
        };
        "Mod+Alt+N" = {
          _props.repeat = false;
          spawn = dms ["notepad" "toggle"];
        };
        "Mod+Alt+V" = {
          _props.repeat = false;
          spawn = dms ["clipboard" "toggle"];
        };
        "Mod+Alt+P" = {
          _props.repeat = false;
          spawn = dms ["powermenu" "toggle"];
        };
        "Mod+Alt+B" = {
          _props.repeat = false;
          spawn = dms ["night" "toggle"];
        };
        "Mod+Alt+Slash" = {
          _props.repeat = false;
          spawn = dms ["keybinds" "toggle" "niri"];
        };
      };

      switch-events = {
        lid-close.spawn = ["niri" "msg" "action" "power-off-monitors"];
        lid-open.spawn = ["niri" "msg" "action" "power-on-monitors"];
      };

      layout = {
        gaps = 2;
        border.width = 1;
        focus-ring.width = 1;
        preset-column-widths._children = [
          {proportion = 1.0 / 3.0;}
          {proportion = 1.0 / 2.0;}
          {proportion = 2.0 / 3.0;}
          {proportion = 1.0;}
        ];
      };

      input = {
        touchpad = {
          tap = [];
          natural-scroll = [];
        };
      };

      include = [
        ["/home/mimir/.config/niri/dms/colors.kdl"]
        ["/home/mimir/.config/niri/dms/alttab.kdl"]
        ["/home/mimir/.config/niri/dms/cursor.kdl"]
        ["/home/mimir/.config/niri/dms/wpblur.kdl"]
        ["/home/mimir/.config/niri/dms/outputs.kdl"]
        ["/home/mimir/.config/niri/dms/windowrules.kdl"]
      ];

      window-rule = [
        {
          _children = [
            {match._children = [];}
            {clip-to-geometry = true;}
            {draw-border-with-background = false;}
            {geometry-corner-radius = 5.0;}
          ];
        }
        {
          match = {
            _props.app-id._raw = ''r#"^steam$"#'';
            _props.title._raw = ''r#"^notificationtoasts_\d+_desktop$"#'';
          };
          default-floating-position._props = {
            x = 10;
            y = 10;
            relative-to = "bottom-right";
          };
        }

        # {
        #   match = {
        #     app-id._raw = ''r#"^steam$"#''; # exact match for Steam
        #     title._raw = ''r#"^notificationtoasts_\\d+_desktop$"#''; # regex for the toast windows
        #   };
        #
        #   default-floating-position = {
        #     x._raw = "10";
        #     y._raw = "10";
        #     relative-to = "bottom-right";
        #   };
        # }
        # {
        #   match = {
        #     app-id._props = {
        #       value._raw = ''r#"^steam$"#''; # exact match on "steam"
        #     };
        #     title._props = {
        #       value._raw = ''r#"^notificationtoasts_\d+_desktop$"#''; # regex for the toast windows
        #     };
        #   };
        #
        #   default-floating-position = {
        #     x._props = {value = 10;};
        #     y._props = {value = 10;};
        #     relative-to._props = {value = "bottom-right";};
        #   };
        # }
      ];
    };
  };

  home.packages = with pkgs; [
    xwayland-satellite
    kitty
    nautilus
    btop
    kew
    wooz
    networkmanagerapplet
    adw-bluetooth
    qt6Packages.qt6ct
  ];
}
