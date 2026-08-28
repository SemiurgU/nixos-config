{
  inputs,
  pkgs,
  ...
}: {
  programs.dsearch.enable = true;
  programs.dsearch.systemd.enable = true;
  programs.dms-shell = {
    enable = true;
    systemd.enable = true;
    quickshell.package = inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default;
    enableAudioWavelength = true;
    enableCalendarEvents = true;
    enableDynamicTheming = true;
    enableSystemMonitoring = true;
    enableVPN = true;
  };
}
