{
  pkgs,
  lib,
  ...
}: let
  dms = cmd: ["dms" "ipc" "call"] ++ cmd;
  dmsKey = cmd: {
    _props.repeat = false;
    spawn = dms cmd;
  };
  mediaKey = cmd: {
    _props = {
      repeat = false;
      allow-when-locked = true;
    };
    spawn = dms cmd;
  };
  volumeKey = cmd: {
    _props.allow-when-locked = true;
    spawn = dms cmd;
  };
  exec = pkg: [(lib.getExe pkg)];
in {
  wayland.windowManager.niri.settings.binds = {
    #----DMS----
    "Mod+Space" = dmsKey ["spotlight" "toggle"];
    "Mod+Alt+Space" = dmsKey ["spotlight-bar" "toggle"];
    "Mod+Alt+L" = dmsKey ["inhibit" "toggle"];
    "Mod+Shift+S" = dmsKey ["niri" "screenshot"];
    "Mod+Alt+M" = dmsKey ["theme" "toggle"];
    "Mod+Alt+N" = dmsKey ["notepad" "toggle"];
    "Mod+Alt+V" = dmsKey ["clipboard" "toggle"];
    "Mod+Alt+P" = dmsKey ["powermenu" "toggle"];
    "Mod+Alt+B" = dmsKey ["night" "toggle"];
    "Mod+P" = dmsKey ["powerprofile" "toggle"];
    #-----------

    #---Audio---
    "XF86AudioPlay" = mediaKey ["mpris" "playPause"];
    "XF86AudioPrev" = mediaKey ["mpris" "previous"];
    "XF86AudioNext" = mediaKey ["mpris" "next"];
    "XF86AudioLowerVolume" = volumeKey ["audio" "decrement" "5"];
    "XF86AudioRaiseVolume" = volumeKey ["audio" "increment" "5"];
    "XF86AudioMute" = volumeKey ["audio" "mute"];

    #-----------

    #---Screen--
    "XF86MonBrightnessUp".spawn = dms ["brightness" "increment" "5" ""];
    "XF86MonBrightnessDown".spawn = dms ["brightness" "decrement" "5" ""];
    #-----------

    #---Niri----
    "Mod+Shift+Slash" = {
      _props.repeat = false;
      show-hotkey-overlay = [];
    };

    "Mod+Shift+E".quit._props.skip-confirmation = false;

    "Mod+O" = {
      _props.repeat = false;
      toggle-overview = [];
    };
    "Mod+Q" = {
      _props.repeat = false;
      close-window = [];
    };

    #---Size----
    "Mod+Shift+F".fullscreen-window = [];
    "Mod+F".expand-column-to-available-width = [];
    "Mod+R".switch-preset-column-width = [];

    #-window-movement
    "Mod+H".focus-column-left = [];
    "Mod+J".focus-window-or-workspace-down = [];
    "Mod+L".focus-column-right = [];
    "Mod+K".focus-window-or-workspace-up = [];

    "Mod+Ctrl+H".move-column-left = [];
    "Mod+Ctrl+J".move-window-down-or-to-workspace-down = [];
    "Mod+Ctrl+K".move-window-up-or-to-workspace-up = [];
    "Mod+Ctrl+L".move-column-right = [];

    "Mod+Comma".consume-or-expel-window-left = [];
    "Mod+Period".consume-or-expel-window-right = [];

    #---Misc----
    "Mod+Return".spawn = exec pkgs.kitty;
    "Mod+Alt+T".spawn = exec pkgs.kitty ++ exec pkgs.btop;
    "Mod+E".spawn = exec pkgs.nautilus;
    "Mod+Z".spawn = exec pkgs.wooz ++ ["--mouse-track"];
  };
}
