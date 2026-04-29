{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.dms-plugins.modules.default
  ];
  programs.dms-shell = {
    enable = true;
    quickshell.package = inputs.quickshell.packages."x86_64-linux".default;
    systemd.enable = true;
    enableAudioWavelength = true;
    enableCalendarEvents = true;
    enableDynamicTheming = true;
    enableSystemMonitoring = true;
    enableVPN = true;

    plugins.dankKDEConnect.enable = true;
  };
}
