{inputs, ...}: {
  programs.dsearch.enable = true;
  programs.dsearch.systemd.enable = true;
  programs.dms-shell = {
    enable = true;
    systemd.enable = true;
    quickshell.package = inputs.quickshell.packages."x86_64-linux".default;
    enableAudioWavelength = true;
    enableCalendarEvents = true;
    enableDynamicTheming = true;
    enableSystemMonitoring = true;
    enableVPN = true;
  };
}
