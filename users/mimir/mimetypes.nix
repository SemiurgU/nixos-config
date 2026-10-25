{
  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      "application/x-extension-htm" = ["firefox.desktop" "dms-open.desktop"];
      "application/x-extension-html" = ["firefox.desktop" "dms-open.desktop"];
      "application/x-extension-shtml" = ["firefox.desktop" "dms-open.desktop"];
      "application/x-extension-xht" = ["firefox.desktop" "dms-open.desktop"];
      "application/x-extension-xhtml" = ["firefox.desktop" "dms-open.desktop"];
      "application/xhtml+xml" = ["firefox.desktop" "dms-open.desktop"];
      "text/html" = ["firefox.desktop" "dms-open.desktop"];
      "x-scheme-handler/chrome" = ["firefox.desktop" "dms-open.desktop"];
      "x-scheme-handler/http" = ["firefox.desktop" "dms-open.desktop"];
      "x-scheme-handler/https" = ["firefox.desktop" "dms-open.desktop"];

      "x-scheme-handler/discord" = ["dev.vencord.Vesktop.desktop" "dms-open.desktop"];
      "x-scheme-handler/tg" = ["io.github.forkgram.tdesktop.desktop" "org.telegram.desktop.desktop" "dms-open.desktop"];
      "x-scheme-handler/tonsite" = ["io.github.forkgram.tdesktop.desktop" "org.telegram.desktop.desktop" "dms-open.desktop"];

      "inode/directory" = ["dms-open.desktop"];
      "x-scheme-handler/file" = ["dms-open.desktop"];

      "image/avif" = ["qimgv.desktop" "dms-open.desktop"];
      "image/bmp" = ["qimgv.desktop" "dms-open.desktop"];
      "image/gif" = ["qimgv.desktop" "dms-open.desktop"];
      "image/jpeg" = ["qimgv.desktop" "dms-open.desktop"];
      "image/png" = ["qimgv.desktop" "dms-open.desktop"];
      "image/svg+xml" = ["qimgv.desktop" "dms-open.desktop"];
      "image/webp" = ["qimgv.desktop" "dms-open.desktop"];
      "image/jxl" = ["qimgv.desktop" "dms-open.desktop"];

      "application/pdf" = ["neovide.desktop" "dms-open.desktop"];
      "application/vnd.comicbook+zip" = ["neovide.desktop" "dms-open.desktop"];
      "application/vnd.comicbook-rar" = ["neovide.desktop" "dms-open.desktop"];
      "application/x-bzpdf" = ["neovide.desktop" "dms-open.desktop"];
      "application/x-ext-pdf" = ["neovide.desktop" "dms-open.desktop"];
      "application/x-gzpdf" = ["neovide.desktop" "dms-open.desktop"];
      "application/json" = ["neovide.desktop" "dms-open.desktop"];
      "application/x-zerosize" = ["neovide.desktop" "dms-open.desktop"];
      "text/markdown" = ["neovide.desktop" "dms-open.desktop"];
      "text/plain" = ["neovide.desktop" "dms-open.desktop"];
      "text/x-c++src" = ["neovide.desktop" "dms-open.desktop"];
      "text/x-csrc" = ["neovide.desktop" "dms-open.desktop"];
      "text/x-python" = ["neovide.desktop" "dms-open.desktop"];
      "text/x-shellscript" = ["neovide.desktop" "dms-open.desktop"];
    };

    associations.added = {
      "application/pdf" = ["neovide.desktop" "krita_pdf.desktop" "dms-open.desktop"];
      "application/x-extension-htm" = ["firefox.desktop" "dms-open.desktop"];
      "application/x-extension-html" = ["firefox.desktop" "dms-open.desktop"];
      "application/x-extension-shtml" = ["firefox.desktop" "dms-open.desktop"];
      "application/x-extension-xht" = ["firefox.desktop" "dms-open.desktop"];
      "application/x-extension-xhtml" = ["firefox.desktop" "dms-open.desktop"];
      "application/xhtml+xml" = ["firefox.desktop" "dms-open.desktop"];
      "image/avif" = ["qimgv.desktop" "dms-open.desktop"];
      "image/bmp" = ["qimgv.desktop" "dms-open.desktop"];
      "image/gif" = ["qimgv.desktop" "dms-open.desktop"];
      "image/jpeg" = ["qimgv.desktop" "dms-open.desktop"];
      "image/png" = ["qimgv.desktop" "dms-open.desktop"];
      "image/svg+xml" = ["qimgv.desktop" "dms-open.desktop"];
      "image/webp" = ["qimgv.desktop" "dms-open.desktop"];
      "inode/directory" = ["dms-open.desktop"];
      "text/html" = ["firefox.desktop" "dms-open.desktop"];
      "x-scheme-handler/chrome" = ["firefox.desktop" "dms-open.desktop"];
      "x-scheme-handler/file" = ["dms-open.desktop"];
      "x-scheme-handler/http" = ["firefox.desktop" "dms-open.desktop"];
      "x-scheme-handler/https" = ["firefox.desktop" "dms-open.desktop"];
      "x-scheme-handler/tg" = ["io.github.forkgram.tdesktop.desktop" "org.telegram.desktop.desktop" "dms-open.desktop"];
      "application/vnd.comicbook+zip" = ["neovide.desktop" "krita_pdf.desktop" "dms-open.desktop"];
      "application/vnd.comicbook-rar" = ["neovide.desktop" "krita_pdf.desktop" "dms-open.desktop"];
      "application/x-bzpdf" = ["neovide.desktop" "krita_pdf.desktop" "dms-open.desktop"];
      "application/x-ext-pdf" = ["neovide.desktop" "krita_pdf.desktop" "dms-open.desktop"];
      "application/x-gzpdf" = ["neovide.desktop" "krita_pdf.desktop" "dms-open.desktop"];
      "application/json" = ["neovide.desktop" "dms-open.desktop"];
      "application/x-zerosize" = ["neovide.desktop" "dms-open.desktop"];
      "text/markdown" = ["neovide.desktop" "dms-open.desktop"];
      "text/plain" = ["neovide.desktop" "dms-open.desktop"];
      "text/x-c++src" = ["neovide.desktop" "dms-open.desktop"];
      "text/x-csrc" = ["neovide.desktop" "dms-open.desktop"];
      "text/x-python" = ["neovide.desktop" "dms-open.desktop"];
      "video/avi" = ["mpv.desktop" "dms-open.desktop"];
      "video/mp4" = ["mpv.desktop" "dms-open.desktop"];
      "video/mpeg" = ["mpv.desktop" "dms-open.desktop"];
      "video/quicktime" = ["mpv.desktop" "dms-open.desktop"];
      "video/webm" = ["mpv.desktop" "dms-open.desktop"];
      "video/x-matroska" = ["mpv.desktop" "dms-open.desktop"];
      "video/matroska" = ["mpv.desktop" "dms-open.desktop"];
      "video/x-msvideo" = ["mpv.desktop" "dms-open.desktop"];
    };
  };
}
