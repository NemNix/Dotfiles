{
  # # programs.fastfetch = {
  # #   enable = true;
  # #   settings = {

  # #     "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";

  # #     logo = {
  # #       type = "kitty";
  # #       height = 20;
  # #       padding = {
  # #         top = 0;
  # #         right = 2;
  # #       };
  # #     };

  # #     display = {
  # #       separator = " ➜  ";
  # #     };

  # #     modules = [
  # #       "break"
  # #       {
  # #         type = "os";
  # #         key = "os   ";
  # #         keycolor = "31";
  # #         format = "{2} {8}";
  # #       }
  # #       {
  # #         type = "kernel";
  # #         key = " ├  ";
  # #         keycolor = "31";
  # #         format = "{2}";
  # #       }
  # #       {
  # #         type = "packages";
  # #         format = "{} (nixpkgs)";
  # #         key = " ├ 󰏖 ";
  # #         keycolor = "31";
  # #       }
  # #       {
  # #         type = "shell";
  # #         key = " └  ";
  # #         keycolor = "31";
  # #       }
  # #       "break"
  # #       {
  # #         type = "wm";
  # #         key = "wm   ";
  # #         keycolor = "32";
  # #         format = "{2}";
  # #       }
  # #       {
  # #         type = "wmtheme";
  # #         key = " ├ 󰉼 ";
  # #         keycolor = "32";
  # #       }
  # #       {
  # #         type = "icons";
  # #         key = " ├ 󰀻 ";
  # #         keycolor = "32";
  #       }
  #       {
  #         type = "cursor";
  #         key = " ├  ";
  #         keycolor = "32";
  #       }
  #       {
  #         type = "terminal";
  #         key = " ├  ";
  #         keycolor = "32";
  #       }
  #       {
  #         type = "terminalfont";
  #         key = " └  ";
  #         keycolor = "32";
  #       }
  #       "break"
  #       {
  #         type = "host";
  #         format = "{5}";
  #         key = "pc   ";
  #         keycolor = "33";
  #       }
  #       {
  #         type = "cpu";
  #         format = "amd ryzen 7 8845hs";
  #         key = " ├  ";
  #         keycolor = "33";
  #       }
  #       {
  #         type = "gpu";
  #         format = "amd radeon 780m";
  #         key = " ├ 󰢮 ";
  #         keycolor = "33";
  #       }
  #       {
  #         type = "memory";
  #         key = " ├  ";
  #         keycolor = "33";
  #       }
  #       {
  #         type = "swap";
  #         key = " ├ 󰓡 ";
  #         keycolor = "33";
  #       }
  #       {
  #         type = "disk";
  #         key = " ├ 󰋊 ";
  #         keycolor = "33";
  #       }
  #       {
  #         type = "monitor";
  #         key = " └  ";
  #         keycolor = "33";
  #         format = "{2}x{3} px";
  #       }
  #     ];
  #   };
  # };




  programs.fastfetch = {
    enable = true;

    settings = {
      display = {
        color = {
          keys = "35";
          output = "90";
        };
      };

      logo = {
        source = ~/Dotfiles/home/wallpapers/nixos.png;
        type = "kitty-direct";
        height = 15;
        width = 30;
        padding = {
          top = 3;
          left = 3;
        };
      };

      modules = [
        "break"
        {
          type = "custom";
          format = "┌──────────────────────Hardware──────────────────────┐";
        }
        {
          type = "cpu";
          key = "│  ";
        }
        {
          type = "gpu";
          key = "│ 󰍛 ";
        }
        {
          type = "memory";
          key = "│ 󰑭 ";
        }
        {
          type = "custom";
          format = "└────────────────────────────────────────────────────┘";
        }
        "break"
        {
          type = "custom";
          format = "┌──────────────────────Software──────────────────────┐";
        }
        {
          type = "custom";
          format = " OS -> ZaneyOS 2.2";
        }
        {
          type = "kernel";
          key = "│ ├ ";
        }
        {
          type = "packages";
          key = "│ ├󰏖 ";
        }
        {
          type = "shell";
          key = "└ └ ";
        }
        "break"
        {
          type = "wm";
          key = " WM";
        }
        {
          type = "wmtheme";
          key = "│ ├󰉼 ";
        }
        {
          type = "terminal";
          key = "└ └ ";
        }
        {
          type = "custom";
          format = "└────────────────────────────────────────────────────┘";
        }
        "break"
        {
          type = "custom";
          format = "┌────────────────────Uptime / Age────────────────────┐";
        }
        {
          type = "command";
          key = "│  ";
          text = #bash
            ''
              birth_install=$(stat -c %W /)
              current=$(date +%s)
              delta=$((current - birth_install))
              delta_days=$((delta / 86400))
              echo $delta_days days
            '';
        }
        {
          type = "uptime";
          key = "│  ";
        }
        {
          type = "custom";
          format = "└────────────────────────────────────────────────────┘";
        }
        "break"
      ];
    };
  };
}



