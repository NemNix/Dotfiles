{
  programs.waybar.settings.mainBar = {
    output = "eDP-1";

    position = "top";
    layer = "top";

    margin-top = 5;
    margin-bottom = 5;
    margin-left = 0;
    margin-right = 0;

    spacing = 8;

    modules-left = [
      "custom/launcher"
      "hyprland/workspaces"
    ];

    "custom/launcher" = {
      format = "  ";
      font-size = 20;
      on-click = "wlogout";
      tooltip = "false";
    };

    "hyprland/workspaces" = {
      "on-click" = "activate";
      format = "{icon}";
      format-icons = {
        active = "";
        empty = "";
        default = "";
        urgent = "";
      };
      "persistent-workspaces" = {
        "1" = [];
        "2" = [];
        "3" = [];
        "4" = [];
        "5" = [];
        "6" = [];
        "7" = [];
        "8" = [];
        "9" = [];
      };
    };

    modules-center = [
      "clock"
    ];

    clock = {
      calendar = {
        format = {today = "<span color='#98971A'><b>{}</b></span>";};
      };
      format = "  {:%H:%M}";
      tooltip = "true";
      tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      format-alt = "  {:%d/%m}";
    };

    modules-right = [
      "tray"
      "pulseaudio"
      "bluetooth"
      "network"
      "memory"
      "cpu"
      "battery"
    ];

    memory = {
      format = "   {}%";
      format-alt = " {used} GiB"; # 
      interval = 2;
    };
    cpu = {
      format = "  {usage}%";
      format-alt = "  {avg_frequency} GHz";
      interval = 2;
    };
    network = {
      format-wifi = "   {signalStrength}%";
      format-ethernet = " ";
      tooltip-format = "Connected to {essid} {ifname} via {gwaddr}";
      format-linked = "{ifname} (No IP)";
      format-disconnected = "󰖪 ";
    };
    bluetooth = {
      format = "   ";
      format-off = " 󰂲";
    };
    tray = {
      icon-size = 20;
      spacing = 8;
    };
    pulseaudio = {
      format = "{icon}  {volume}%";
      "format-bluetooth" = "󰂰";
      nospacing = 1;
      "tooltip-format" = "Volume : {volume}%";
      "format-muted" = "󰝟";
      "format-icons" = {
        "headphone" = "";
        "default" = ["󰖀" "󰕾" ""];
      };
      "on-click" = "pwvucontrol";
      "scroll-step" = 1;
    };

    battery = {
      format = "{icon}  {capacity}% ";
      "format-icons" = {
        "charging" = ["󰢜" "󰂆" "󰂇" "󰂈" "󰢝" "󰂉" "󰢞" "󰂊" "󰂋" "󰂅"];
        "default" = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
      };
      "format-full" = "󰁹 ";
      interval = 10;
      states = {
        warning = 20;
        critical = 10;
      };
      tooltip = true;
    };
  };
}
