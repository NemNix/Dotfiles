{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar.overrideAttrs (oa: { mesonFlags = (oa.mesonFlags or [ ]) ++ [ "-Dexperimental=true" ]; });

    settings.mainBar = {

      output = [ "eDP-1" ];
      exclusive = true;
      fixed-center = true;

      layer = "top";
      position = "top";

      margin-top = 0;
      margin-bottom = 4;
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
        format = " {icon}";
        format-icons = {
          "activated" = "󰅶 ";
          "deactivated" = "󰾪 ";
        };
      };

      clock = {
        interval = 60;
        format = " {:%a  %d  %b | %H:%M} ";
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
        tooltip = false;
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
        padding: 0;
        border-radius: 0;
        min-height: 0;
        margin: 0;
        border: none;
        text-shadow: none;
        transition: none;
        box-shadow: none;
        font-weight: 600;
        background: transparent;
      }

      #privacy,
      #bluetooth,
      #idle_inhibitor {
        font-size: 16px;
      }

      /* ================================ */
      /*       workspaces module          */
      /* ================================ */

      #workspaces {
        font-size: 15px;
        color: #EE99A0;
        border: 2px solid #EE99A0;
      }

      #workspaces button {
        padding: 0 0.5rem;
        margin: 0.20em;
      }

      #workspaces button.active {
        color : #EE99A0;
      }

     #tray {
        font-size: 15px;
        padding-left: 10px;
        padding-right: 10px;
      }

      #clock {
        color: #CAD4F5;
        font-size : 14px;
        border: 2px solid #CAD4F5;
      }

      #cpu {
        color: #eba0ac;
        font-size : 14px;
        border: 2px solid #eba0ac;
      }

      #memory {
        color: #f5c2e7;
        font-size : 14px;
        border: 2px solid #f5c2e7;
      }

      #network {
        color: #C6A0F6;
        font-size : 14px;
        border: 2px solid #C6A0F6;
      }

      #pulseaudio {
        color: #8AADF4;
        font-size : 14px;
        border: 2px solid #8AADF4;
      }

      #backlight {
        color: #f9e2af;
        font-size : 14px;
        border: 2px solid #f9e2af;
      }

      #battery {
        color: #A6DA95;
        font-size : 14px;
        border: 2px solid #A6DA95;
      }
    '';
  };
}
