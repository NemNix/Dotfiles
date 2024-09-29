{lib, ...}: {
  programs.foot = {
    enable = true;

    settings = {
      main = {
        font = "nerdfonts:size=14:antialias=true";
        font-bold = "nerdfonts:size=14:antialias=true";
        font-italic = "nerdfonts:size=14:antialias=true";
        font-bold-italic = "nerdfonts:size=14:antialias=true";
        pad = "20x20";
        vertical-letter-offset = "-4px";
        line-height = "25px";
        letter-spacing = "-3px";
        dpi-aware = "no";
      };

      mouse = {
        hide-when-typing = "yes";
      };

      tweak = {
        font-monospace-warn = "no";
      };
      colors = {
        foreground = "cdd6f4";
        background = "1e1e2e";
        regular0 = "1e1e2e "; # black
        regular1 = "f38ba8"; # red
        regular2 = "a6e3a1"; # green
        regular3 = "f9e2af"; # yellow
        regular4 = "89b4fa"; # blue
        regular5 = "cba6f7"; # magenta
        regular6 = "94e2d5"; # cyan
        regular7 = "cdd6f4"; # white
        bright0 = "45475a"; # bright black
        bright1 = "f38ba8"; # bright red
        bright2 = "a6e3a1"; # bright green
        bright3 = "f9e2af"; # bright yellow
        bright4 = "89b4fa "; # bright blue
        bright5 = "cba6f7"; # bright magenta
        bright6 = "94e2d5"; # bright cyan
        bright7 = "b4befe "; # bright white
      };
    };
  };
}
