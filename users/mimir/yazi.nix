{pkgs, ...}: {
  programs.yazi = {
    enable = true;
    flavors.kanagawa = pkgs.yaziPlugins.kanagawa;
    theme.flavor = {
      dark = "kanagawa";
      light = "kanagawa";
    };
    plugins = {
      # we can use inherit but this way i will remember what i added
      lazygit.package = pkgs.yaziPlugins.lazygit;
      no-status = {
        package = pkgs.yaziPlugins.no-status;
        setup = true;
      };
      allmytoes = {
        package = pkgs.yaziPlugins.allmytoes;
        setup = true;
      };
      ouch.package = pkgs.yaziPlugins.ouch;
      smart-enter.package = pkgs.yaziPlugins.smart-enter;
      kdeconnect-send = {
        package = pkgs.yaziPlugins.kdeconnect-send;
      };
    };
    settings.plugin = {
      prepend_previewers = [
        {
          mime = "image/svg+xml";
          run = "magick";
        }
        {
          mime = "image/heic";
          run = "magick";
        }
        {
          mime = "image/jxl";
          run = "magick";
        }
        {
          mime = "image/*";
          run = "allmytoes";
        }
        {
          mime = "application/{*zip,tar,bzip2,7z*,rar,xz,zstd,java-archive}";
          run = "ouch";
        }
      ];

      prepend_preloaders = [
        {
          mime = "image/svg+xml";
          run = "magick";
        }
        {
          mime = "image/heic";
          run = "magick";
        }
        {
          mime = "image/jxl";
          run = "magick";
        }
        {
          mime = "image/*";
          run = "allmytoes";
        }

        {
          mime = "application/";
          run = "mediainfo";
        }
      ];
    };
    keymap.mgr.prepend_keymap = [
      {
        on = "<C-s>";
        run = "plugin kdeconnect-send";
        desc = "Send selected files with KDE Connect";
      }
      {
        on = "l";
        run = "plugin smart-enter";
        desc = "Enter the child directory, or open the file";
      }
      {
        on = ["g" "g"];
        run = "plugin lazygit";
        desc = "run lazygit";
      }
      {
        on = ["C"];
        run = "plugin ouch";
        desc = "Compress with ouch";
      }
    ];
    extraPackages = [
      pkgs.ouch
      pkgs.mediainfo
      pkgs.exiftool
      pkgs.allmytoes
      pkgs.imagemagick
    ];
  };
}
