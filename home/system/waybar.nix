{pkgs, ...}: {
  programs.waybar = {
    enable = true;
    package = pkgs.waybar.overrideAttrs (oa: {mesonFlags = (oa.mesonFlags or []) ++ ["-Dexperimental=true"];});

    settings.mainBar = {
      output = ["eDP-1"];
      exclusive = true;
      fixed-center = true;

      position = "top";
      layer = "top";

      margin-top = 0;
      margin-bottom = 5;
      margin-left = 0;
      margin-right = 0;

      spacing = 10;

      # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      # Modules position
      # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

      modules-left = [
        "hyprland/workspaces"
        "tray"
        "idle_inhibitor"
        "privacy"
        "bluetooth"
      ];

      modules-center = [
        "clock"
      ];

      modules-right = [
        "backlight"
        "pulseaudio"
        "network"
        "memory"
        "cpu"
        "battery"
      ];

      # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      # Modules configuration
      # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

      "hyprland/workspaces" = {
        on-click = "activate";
        format = "{icon} {windows}";
        format-icons = {
          "1" = "Web:";
          "2" = "Dev:";
          "3" = "Chat:";
          "4" = "Music:";
          "5" = "Gaming:";
        };

        format-windows-separator = "  ";
        window-rewrite-default = "";
        window-rewrite = {
          "kitty" = "";
          "codium" = "󰨞";
          "zen" = "";
          "Spotube" = "";
          "steam" = "";
        };

        persistent-workspaces = {
          "1" = [];
          "2" = [];
          "3" = [];
          "4" = [];
          "5" = [];
        };
      };

      tray = {
        icon-size = 21;
        spacing = 8;
      };

      bluetooth = {
        format = "";
        format-off = "󰂲";
        format-disabled = "󰂲";
        on-click = "bluetoothctl power on";
        on-click-right = "bluetoothctl power off ";
      };

      idle_inhibitor = {
        format = "{icon}";
        format-icons = {
          "activated" = "";
          "deactivated" = "󰾪";
        };
      };

      clock = {
        interval = 60;
        format = "{:%a, %d, %b, %H:%M}";
      };

      backlight = {
        format = "{icon}  {percent}%";
        format-icons = ["" "" "" "" "" "" "" "" ""];
      };

      memory = {
        format = "   {used}";
        interval = 2;
      };

      network = {
        format-wifi = "   {signalStrength}%";
        format-ethernet = " ";
        tooltip-format = "Connected to {essid} {ifname} via {gwaddr}";
        format-linked = "{ifname} (No IP)";
        format-disconnected = "󰖪 ";
      };

      pulseaudio = {
        format = " {icon}   {volume}% ";
        format-muted = "󰝟";
        on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        on-click-right = "pwvucontrol";
        format-icons = ["" "" "" "" ""];
      };

      cpu = {
        format = "   {usage}% ";
        format-alt = "  {avg_frequency} GHz";
        interval = 2;
      };

      battery = {
        format = " {icon} {capacity}% ";
        format-icons = {
          charging = ["󰢜" "󰂆" "󰂇" "󰂈" "󰢝" "󰂉" "󰢞" "󰂊" "󰂋" "󰂅"];
          default = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
        };
        format-full = "󰁹 ";
        interval = 10;
        states = {
          warning = 20;
          critical = 10;
        };
      };
    };
    style = ''
      * {
        font-family: nerdfonts;
        font-weight: 800;
        background: transparent;
      }

      #workspaces,
      #tray,
      #bluetooth,
      #idle_inhibitor,
      #clock,
      #backlight,
      #memory,
      #network,
      #clock
      #cpu
      #battery
      #pulseaudio {
        font-size: 14px;
        padding-right: 10px;
        padding-left: 10px;
      }

      #privacy,
      #bluetooth,
      #idle_inhibitor {
         font-size: 18px;
         }

      #workspaces {
        font-size: 15px;
        font-weight: 700;
        color: #EE99A0;
        border: 3px solid #EE99A0;
      }

      #tray {
        padding-left: 3px;
        padding-right: 3px;
      }

      #clock {
        color: #CAD3F5;
        border: 3px solid #CAD3F5;
      }

      #cpu {
        color: #eba0ac;
        border: 3px solid #eba0ac;
      }

      #memory {
        color: #f5c2e7;
        border: 3px solid #f5c2e7;
      }

      #network {
        color: #C6A0F6;
        border: 3px solid #C6A0F6;
      }

      #pulseaudio {
        color: #8AADF4;
        border: 3px solid #8AADF4;
      }

      #backlight {
        color: #f9e2af;
        border: 3px solid #f9e2af;
      }

      #battery {
        color: #A6DA95;
        border: 3px solid #A6DA95;
      }
    '';
  };
}
