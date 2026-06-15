{
  wayland.windowManager.niri = {
    environment = {
      QT_QPA_PLATFORMTHEME = "kvantum";
      QT_STYLE_OVERRIDE = "kvantum";
      QT_QPA_PLATFORM = "wayland;xcb";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      GDK_BACKEND = "wayland,x11";
    };
  };
}
