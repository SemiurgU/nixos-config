{
  pkgs,
  lib,
  ...
}: let
  dms = cmd: ["dms" "ipc" "call"] ++ cmd;
  dmsKey = title: cmd: {
    _props = {
      repeat = false;
      hotkey-overlay-title = title;
    };
    spawn = dms cmd;
  };
  mediaKey = title: cmd: {
    _props = {
      repeat = false;
      allow-when-locked = true;
      hotkey-overlay-title = title;
    };
    spawn = dms cmd;
  };
  volumeKey = title: cmd: {
    _props = {
      allow-when-locked = true;
      hotkey-overlay-title = title;
    };
    spawn = dms cmd;
  };
  exec = pkg: [(lib.getExe pkg)];
in {
  wayland.windowManager.niri.settings.binds = {
    #----DMS----
    "Mod+Space" = dmsKey "Toggle Spotlight" ["spotlight" "toggle"];
    "Mod+Alt+Space" = dmsKey "Toggle Spotlight Bar" ["spotlight-bar" "toggle"];
    "Mod+Alt+I" = dmsKey "Toggle Inhibit (Keep Awake)" ["inhibit" "toggle"];
    "Mod+Shift+S" = dmsKey "Screenshot" ["niri" "screenshot"];
    "Mod+Alt+M" = dmsKey "Toggle Light/Dark Theme" ["theme" "toggle"];
    "Mod+Alt+N" = dmsKey "Toggle Notepad" ["notepad" "toggle"];
    "Mod+Alt+V" = dmsKey "Toggle Clipboard History" ["clipboard" "toggle"];
    "Mod+Alt+P" = dmsKey "Power Menu" ["powermenu" "toggle"];
    "Mod+Alt+B" = dmsKey "Toggle Bar" ["bar" "toggle" "index" "0"];
    "Mod+P" = dmsKey "Cycle Power Profile" ["powerprofile" "toggle"];
    "Mod+Alt+T" = dmsKey "Show Process List" ["processlist" "toggle"];
    #-----------
    #---Audio---
    "XF86AudioPlay" = mediaKey "Play/Pause Media" ["mpris" "playPause"];
    "XF86AudioPrev" = mediaKey "Previous Track" ["mpris" "previous"];
    "XF86AudioNext" = mediaKey "Next Track" ["mpris" "next"];
    "XF86AudioLowerVolume" = volumeKey "Volume Down" ["audio" "decrement" "5"];
    "XF86AudioRaiseVolume" = volumeKey "Volume Up" ["audio" "increment" "5"];
    "XF86AudioMute" = volumeKey "Mute Volume" ["audio" "mute"];
    #-----------
    #---Screen--
    "XF86MonBrightnessUp" = {
      _props.hotkey-overlay-title = "Brightness Up";
      spawn = dms ["brightness" "increment" "5" ""];
    };
    "XF86MonBrightnessDown" = {
      _props.hotkey-overlay-title = "Brightness Down";
      spawn = dms ["brightness" "decrement" "5" ""];
    };
    #-----------
    #---Niri----
    "Mod+Shift+Slash" = {
      _props = {
        repeat = false;
        hotkey-overlay-title = "Show Hotkey Overlay";
      };
      show-hotkey-overlay = [];
    };
    "Mod+Shift+E" = {
      _props.hotkey-overlay-title = "Quit niri";
      quit._props.skip-confirmation = false;
    };
    "Mod+O" = {
      _props = {
        repeat = false;
        hotkey-overlay-title = "Toggle Overview";
      };
      toggle-overview = [];
    };
    "Mod+Q" = {
      _props = {
        repeat = false;
        hotkey-overlay-title = "Close Window";
      };
      close-window = [];
    };
    #---Size----
    "Mod+Shift+F" = {
      _props.hotkey-overlay-title = "Fullscreen Window";
      fullscreen-window = [];
    };
    "Mod+F" = {
      _props.hotkey-overlay-title = "Expand Column to Available Width";
      expand-column-to-available-width = [];
    };
    "Mod+R" = {
      _props.hotkey-overlay-title = "Switch Preset Column Width";
      switch-preset-column-width = [];
    };
    #-window-movement
    "Mod+H" = {
      _props.hotkey-overlay-title = "Focus Column Left";
      focus-column-left = [];
    };
    "Mod+J" = {
      _props.hotkey-overlay-title = "Focus Down / Workspace Down";
      focus-window-or-workspace-down = [];
    };
    "Mod+L" = {
      _props.hotkey-overlay-title = "Focus Column Right";
      focus-column-right = [];
    };
    "Mod+K" = {
      _props.hotkey-overlay-title = "Focus Up / Workspace Up";
      focus-window-or-workspace-up = [];
    };
    "Mod+Ctrl+H" = {
      _props.hotkey-overlay-title = "Move Column Left";
      move-column-left = [];
    };
    "Mod+Ctrl+J" = {
      _props.hotkey-overlay-title = "Move Window Down / to Workspace Down";
      move-window-down-or-to-workspace-down = [];
    };
    "Mod+Ctrl+K" = {
      _props.hotkey-overlay-title = "Move Window Up / to Workspace Up";
      move-window-up-or-to-workspace-up = [];
    };
    "Mod+Ctrl+L" = {
      _props.hotkey-overlay-title = "Move Column Right";
      move-column-right = [];
    };
    "Mod+Comma" = {
      _props.hotkey-overlay-title = "Consume/Expel Window Left";
      consume-or-expel-window-left = [];
    };
    "Mod+Period" = {
      _props.hotkey-overlay-title = "Consume/Expel Window Right";
      consume-or-expel-window-right = [];
    };
    #Niri-sidebar
    "Mod+S" = {
      _props.hotkey-overlay-title = "Toggle Sidebar Window";
      spawn = exec pkgs.niri-sidebar ++ ["toggle-window"];
    };
    "Mod+Alt+S" = {
      _props.hotkey-overlay-title = "Toggle Sidebar Visibility";
      spawn = exec pkgs.niri-sidebar ++ ["toggle-visibility"];
    };
    "Mod+Alt+F" = {
      _props.hotkey-overlay-title = "Flip Sidebar";
      spawn = exec pkgs.niri-sidebar ++ ["flip"];
    };
    "Mod+Alt+R" = {
      _props.hotkey-overlay-title = "Reorder Sidebar";
      spawn = exec pkgs.niri-sidebar ++ ["reorder"];
    };
    #---Misc----
    "Mod+Return" = {
      _props.hotkey-overlay-title = "Open Terminal";
      spawn = exec pkgs.kitty;
    };
    "Mod+E" = {
      _props.hotkey-overlay-title = "Open File Manager";
      spawn = exec pkgs.nautilus;
    };
    "Mod+Z" = {
      _props.hotkey-overlay-title = "Zoom (Mouse Tracking)";
      spawn = exec pkgs.wooz ++ ["--mouse-track"];
    };
    "Mod+W" = {
      _props.hotkey-overlay-title = "Toggle Floating";
      toggle-window-floating = [];
    };
    "Mod+G" = {
      _props.hotkey-overlay-title = "Freeze/Unfreeze Focused Window";
      spawn = exec pkgs.wl-freeze ++ ["-a"];
    };
    "Mod+M" = {
      _props.hotkey-overlay-title = "Start/Stop Music";
      spawn-sh = "pkill -x mpv || mpv --no-video --shuffle ~/Music/ &";
    };
  };
}
