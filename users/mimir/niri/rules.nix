{
  wayland.windowManager.niri.settings = {
    layer-rule = {
      match._props.namespace = "dms:blurwallpaper";
      place-within-backdrop = true;
    };

    recent-windows.highlight = {
      corner-radius = 5;
      active-color = "#6c8446";
      urgent-color = "#e57e80";
    };
    _children = [
      {
        window-rule._children = [
          {match._children = [];}
          {clip-to-geometry = true;}
          {draw-border-with-background = false;}
          {geometry-corner-radius = 5.0;}
          {min-width = 100;}
          {min-height = 100;}
        ];
      }
      {
        window-rule._children = [
          {
            match._props = {
              app-id = "^firefox$";
              title = "^Picture-in-Picture$";
            };
          }
          {open-floating = true;}
          {open-maximized = false;}
          {default-column-width._children = [{fixed = 480;}];}
          {default-window-height._children = [{fixed = 270;}];}
          {
            default-floating-position._props = {
              x = 32;
              y = 32;
              relative-to = "bottom-right";
            };
          }
        ];
      }
      {
        window-rule._children = [
          {match._props.app-id = "^org.kde.kdeconnect.daemon$";}
          {open-floating = true;}
          {open-fullscreen = false;}
          {open-focused = true;}
          {default-column-width._children = [{proportion = 1.0;}];}
          {default-window-height._children = [{proportion = 1.0;}];}
          {
            default-floating-position._props = {
              x = 0;
              y = 0;
              relative-to = "top-left";
            };
          }
        ];
      }
    ];
  };
}
