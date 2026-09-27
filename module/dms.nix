{
  programs.dsearch.enable = true;
  programs.dsearch.systemd.enable = true;
  programs.dms-shell = {
    enable = true;
    systemd.enable = true;
    enableAudioWavelength = true;
    enableCalendarEvents = true;
    enableDynamicTheming = true;
    enableVPN = true;
  };
}
