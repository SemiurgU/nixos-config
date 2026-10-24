{pkgs, ...}: {
  programs.mpv = {
    enable = true;
    config = {
      cache = "yes";
      demuxer-max-bytes = "1024MiB";
      demuxer-max-back-bytes = "512MiB";
      osc = true;
      sub-auto = "fuzzy";
      audio-file-auto = "fuzzy";
      ytdl-format = "bestvideo+bestaudio/best";
      screenshot-format = "png";
      screenshot-directory = "~/Pictures/mpv-screenshots";
    };
    scripts = with pkgs; [
      mpvScripts.webtorrent-mpv-hook
      mpvScripts.thumbfast
      mpvScripts.mpris
      mpvScripts.sponsorblock
    ];
  };

  xdg.mimeApps.enable = true;
  xdg.mimeApps.defaultApplications = {
    "video/x-matroska" = ["mpv.desktop"];
    "video/matroska" = ["mpv.desktop"];
    "video/mp4" = ["mpv.desktop"];
    "video/webm" = ["mpv.desktop"];
    "video/x-msvideo" = ["mpv.desktop"];
    "video/quicktime" = ["mpv.desktop"];
    "video/mpeg" = ["mpv.desktop"];
    "video/ogg" = ["mpv.desktop"];
  };
}
