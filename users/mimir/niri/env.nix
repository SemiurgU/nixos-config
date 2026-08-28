{
  wayland.windowManager.niri.settings = {
    environment = {
      GDK_BACKEND = "wayland,x11";
      NIXOS_OZONE_WL = "1";
      QT_QPA_PLATFORM = "wayland";
      MOZ_ENABLE_WAYLAND = "1";
    };
  };
}
