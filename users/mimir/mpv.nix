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
}
