{
  wayland.windowManager.niri.settings = {
    layout = {
      gaps = 4;
      border.width = 1;
      focus-ring.width = 1;
      preset-column-widths._children = [
        {proportion = 1.0 / 3.0;}
        {proportion = 1.0 / 2.0;}
        {proportion = 2.0 / 3.0;}
        {proportion = 1.0;}
      ];

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
  };
}
