{
  programs.i3status = {
    enable = true;
    enableDefault = false;

    general = {
      output_format = "i3bar";
      colors = false;
      interval = 1;
      color_good = "#aaff00";
      color_degraded = "#00dddd";
      color_bad = "#ff8800";
      markup = "pango";
    };

    modules = {

      "battery 0" = {
        enable = true;
        position = 6;
        settings = {
          format = "<span color='#A6DA95' size='large'>%status</span> <span bgcolor='#a6da95' foreground='#1e1e2e'> %percentage </span>";
          format_down = "No battery";
          status_chr = "CHARGING";
          status_bat = "BAT";
          status_unk = "UNK";
          status_full = "!FULL!";
          status_idle = "IDLE";
          low_threshold = 30;
          integer_battery_capacity = true;
        };
      };

      memory = {
        enable = true;
        position = 4;
        settings = {
          format = "<span color='#f5c2e7' size='large'>MEM</span> <span bgcolor='#f5c2e7' foreground='#1e1e2e'> %used </span>";
          threshold_degraded = "10%";
          format_degraded = "MEMORY: %free";
        };
      };

      cpu_usage = {
        enable = true;
        position = 5;
        settings = {
          format = "<span color='#eba0ac' size='large'>CPU</span> <span bgcolor='#eba0ac' foreground='#1e1e2e'> %usage </span>";
        };
      };

      time = {
        enable = true;
        position = 6;
        settings = {
          format = "<span color='#cdd6f4' size='large'>TIME</span> <span bgcolor='#cdd6f4' foreground='#1e1e2e'> %H:%M </span>";
        };
      };

      "wireless _first_" = {
        enable = true;
        position = 3;
        settings = {
          format_up = "<span color='#C6A0F6' size='large'>WIFI</span> <span bgcolor='#C6A0F6' foreground='#1e1e2e'> %essid </span>";
          format_down = "";
        };
      };

      "volume master" = {
        enable = true;
        position = 2;
        settings = {
          format = "<span color='#8AADF4' size='large'>VOL</span> <span bgcolor='#8AADF4' foreground='#1e1e2e'> %volume </span>";
          format_muted = "<span color='#8AADF4' size='large'>MUTED</span> <span bgcolor='#8AADF4' foreground='#1e1e2e'> %volume </span>";
        };
      };

      "read_file brightness" = {
        enable = true;
        position = 1;
        settings = {
          path = "/sys/class/backlight/amdgpu_bl0/actual_brightness";
          format = "<span color='#f9e2af' size='large'>LUM</span> <span bgcolor='#f9e2af' foreground='#1e1e2e'> %content </span>";
        };
      };
    };
  };
}

