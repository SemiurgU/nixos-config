{
  wayland.windowManager.niri.settings = {
    screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";
    hotkey-overlay = {
      hide-not-bound = [];
      skip-at-startup = [];
    };
    prefer-no-csd = true;

    input = {
      keyboard.xkb = {
        layout = "gb,ua";
        variant = ",phonetic";
        options = "grp:alt_shift_toggle";
      };

      touchpad = {
        tap = [];
        drag = true;
        natural-scroll = [];
      };
    };
    cursor = {
      xcursor-theme = "Bibata-Modern-Ice";
      xcursor-size = 24;
      hide-when-typing = {};
    };

    switch-events = {
      lid-close.spawn = ["niri" "msg" "action" "power-off-monitors"];
      lid-open.spawn = ["niri" "msg" "action" "power-on-monitors"];
    };
  };
}
