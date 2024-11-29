{
  programs.fastfetch = {
    enable = true;
    settings = {

      "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";

      logo = {
        type = "kitty";
        height = 20;
        padding = {
          top = 0;
          right = 2;
        };
      };

      display = {
        separator = " ➜  ";
      };

      modules = [
        "break"
        {
          type = "os";
          key = "OS   ";
          keyColor = "31";
          format = "{2} {8}";
        }
        {
          type = "kernel";
          key = " ├  ";
          keyColor = "31";
          format = "{2}";
        }
        {
          type = "packages";
          format = "{} (nixpkgs)";
          key = " ├ 󰏖 ";
          keyColor = "31";
        }
        {
          type = "shell";
          key = " └  ";
          keyColor = "31";
        }
        "break"
        {
          type = "wm";
          key = "WM   ";
          keyColor = "32";
          format = "{2}";
        }
        {
          type = "wmtheme";
          key = " ├ 󰉼 ";
          keyColor = "32";
        }
        {
          type = "icons";
          key = " ├ 󰀻 ";
          keyColor = "32";
        }
        {
          type = "cursor";
          key = " ├  ";
          keyColor = "32";
        }
        {
          type = "terminal";
          key = " ├  ";
          keyColor = "32";
        }
        {
          type = "terminalfont";
          key = " └  ";
          keyColor = "32";
        }
        "break"
        {
          type = "host";
          format = "{5}";
          key = "PC   ";
          keyColor = "33";
        }
        {
          type = "cpu";
          format = "AMD Ryzen 7 8845HS";
          key = " ├  ";
          keyColor = "33";
        }
        {
          type = "gpu";
          format = "AMD Radeon 780M";
          key = " ├ 󰢮 ";
          keyColor = "33";
        }
        {
          type = "memory";
          key = " ├  ";
          keyColor = "33";
        }
        {
          type = "swap";
          key = " ├ 󰓡 ";
          keyColor = "33";
        }
        {
          type = "disk";
          key = " ├ 󰋊 ";
          keyColor = "33";
        }
        {
          type = "monitor";
          key = " └  ";
          keyColor = "33";
          format = "{2}x{3} px";
        }
      ];
    };
  };
}

