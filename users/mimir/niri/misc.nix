{
  wayland.windowManager.niri.settings = {
    screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";
    hotkey-overlay = {
      hide-not-bound = [];
      skip-at-startup = [];
    };
    prefer-no-csd = true;

    input = {
      touchpad = {
        tap = [];
        natural-scroll = [];
      };
    };

    switch-events = {
      lid-close.spawn = ["niri" "msg" "action" "power-off-monitors"];
      lid-open.spawn = ["niri" "msg" "action" "power-on-monitors"];
    };
  };
}
