{
  wayland.windowManager.niri.settings = {
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
        _children = [
          {
            match = {
              _props = {
                app-id = "kitty";
                title = "btop";
              };
            };
          }

          {open-fullscreen = true;}
          {open-focused = true;}
          {opacity = 0.9;}
        ];
      }
    ];
  };
}
