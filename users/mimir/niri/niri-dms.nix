{
  wayland.windowManager.niri.settings = {
    cursor = {
      xcursor-theme = "Bibata-Modern-Ice";
      xcursor-size = 24;
      hide-when-typing = {};
    };

    layout = {
      background-color = "transparent";
      border = {
        active-color = "#a7c080";
        inactive-color = "#9da9a0";
        urgent-color = "#e57e80";
      };
      focus-ring = {
        active-color = "#a7c080";
        inactive-color = "#9da9a0";
        urgent-color = "#e57e80";
      };
      shadow.color = "#00000070";
      tab-indicator = {
        active-color = "#a7c080";
        inactive-color = "#9da9a0";
        urgent-color = "#e57e80";
      };
      insert-hint.color = "#a7c08080";
    };

    recent-windows.highlight = {
      corner-radius = 5;
      active-color = "#6c8446";
      urgent-color = "#e57e80";
    };

    layer-rule = {
      match._props.namespace = "dms:blurwallpaper";
      place-within-backdrop = true;
    };

    _children = [
      {
        window-rule._children = [
          {geometry-corner-radius = 12;}
          {clip-to-geometry = true;}
          {tiled-state = true;}
          {draw-border-with-background = false;}
        ];
      }
    ];
  };
}
