{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar.overrideAttrs (oa: { mesonFlags = (oa.mesonFlags or [ ]) ++ [ "-Dexperimental=true" ]; });

    settings.mainBar = {

      output = [ "eDP-1" ];
      exclusive = true;
      fixed-center = true;

      position = "top";
      layer = "top";

      margin-top = 0;
      margin-bottom = 3;
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
          "1" = " ";
          "2" = " ";
          "3" = " ";
          "4" = " ";
          "5" = "";
        };

        persistent-workspaces = {
          "1" = [ ];
          "2" = [ ];
          "3" = [ ];
          "4" = [ ];
          "5" = [ ];
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
        format = " {:%a, %d, %b, %H:%M} ";
      };

      backlight = {
        tooltip = false;
        format = " {icon}  {percent}% ";
        format-icons = [ "" "" "" "" "" "" "" "" "" ];
      };

      memory = {
        tooltip = false;
        format = "    {used} ";
        interval = 2;
      };

      network = {
        format-wifi = "    {essid} ";
        format-ethernet = "  ";
        tooltip-format = "Connected to {essid} {ifname} via {gwaddr}";
        format-linked = "{ifname} (No IP)";
        format-disconnected = "";
      };

      pulseaudio = {
        tooltip = false;
        format = " {icon}   {volume}% ";
        format-muted = " 󰝟 ";
        on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        on-click-right = "pwvucontrol";
        format-icons = [ "" "" "" "" "" ];
      };

      cpu = {
        tooltip = false;
        format = "   {usage}% ";
        interval = 2;
      };

      battery = {
        format = " {icon} {capacity}% ";
        format-icons = {
          charging = [ "󰢜" "󰂆" "󰂇" "󰂈" "󰢝" "󰂉" "󰢞" "󰂊" "󰂋" "󰂅" ];
          default = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
        };
        format-full = "󰁹 ";
        interval = 10;
        states = {
          warning = 20;
          critical = 10;
        };
      };
    };

    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    # CSS Styling
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    style = ''
          * {
        font-family: DejaVu Sans;
        font-weight: 700;
        background: transparent;
        padding-top : 1px;
        padding-bottom : 1px;
      }

      #cpu
      #tray
      #clock
      #battery
      #memory
      #network
      #backlight
      #bluetooth
      #pulseaudio
      #workspaces {
        font-size: 13px;
        padding-right: 10px;
        padding-left: 10px;
      }

      #privacy,
      #bluetooth,
      #idle_inhibitor {
        padding-right: 10px;
        padding-left: 10px;
        font-size: 18px;
        font-weight: 800;
      }

      #workspaces {
        font-size: 15px;
        font-weight: 700;
        color: #EE99A0;
        border: 2px solid #EE99A0;
      }

      #tray {
        padding-left: 3px;
        padding-right: 3px;
      }

      #clock {
        color: #CAD3F5;
        border: 2px solid #CAD3F5;
      }

      #cpu {
        color: #eba0ac;
        border: 2px solid #eba0ac;
      }

      #memory {
        color: #f5c2e7;
        border: 2px solid #f5c2e7;
      }

      #network {
        color: #C6A0F6;
        border: 2px solid #C6A0F6;
      }

      #pulseaudio {
        color: #8AADF4;
        border: 2px solid #8AADF4;
      }

      #backlight {
        color: #f9e2af;
        border: 2px solid #f9e2af;
      }

      #battery {
        color: #A6DA95;
        border: 2px solid #A6DA95;
      }
    '';
  };
}
