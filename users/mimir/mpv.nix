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
    "audio/aac" = ["mpv.desktop" "dms-open.desktop"];
    "audio/mpeg" = ["mpv.desktop" "dms-open.desktop"];
    "audio/ogg" = ["mpv.desktop" "dms-open.desktop"];
    "audio/wav" = ["mpv.desktop" "dms-open.desktop"];
    "audio/webm" = ["mpv.desktop" "dms-open.desktop"];
    "audio/x-flac" = ["mpv.desktop" "dms-open.desktop"];
    "video/avi" = ["mpv.desktop" "dms-open.desktop"];
    "video/matroska" = ["mpv.desktop" "dms-open.desktop"];
    "video/mp4" = ["mpv.desktop" "dms-open.desktop"];
    "video/mpeg" = ["mpv.desktop" "dms-open.desktop"];
    "video/ogg" = ["mpv.desktop" "dms-open.desktop"];
    "video/quicktime" = ["mpv.desktop" "dms-open.desktop"];
    "video/webm" = ["mpv.desktop" "dms-open.desktop"];
    "video/x-matroska" = ["mpv.desktop" "dms-open.desktop"];
    "video/x-msvideo" = ["mpv.desktop" "dms-open.desktop"];
  };
}
