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
            open-focused = true;
            opacity = 0.9;
          }
        ];
      }
      {
        _children = [
          {
            match = {
              _props.app-id._raw = ''r#"^firefox$"#'';
              _props.title._raw = ''r#"^Picture-in-Picture$"#'';
            };
            open-floating = true;
            open-maximized = false;
            default-column-width._children = [{fixed = 480;}];
            default-window-height._children = [{fixed = 270;}];
            default-floating-position._props = {
              x = 32;
              y = 32;
              relative-to = "bottom-right";
            };
          }
        ];
      }
    ];
  };
}
