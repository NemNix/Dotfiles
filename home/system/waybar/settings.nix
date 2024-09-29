{
  programs.waybar.settings.mainBar = {
    output = [
      "eDP-1"
    ];
    exclusive = true;
    fixed-center = true;

    position = "top";
    layer = "top";

    margin-top = 5;
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
      format-disabled = "󰂲";
      format-off = "";
    };

    idle_inhibitor = {
      format = "{icon}";
      format-icons = {
        activated = "";
        desactivated = "󰾪";
      };
    };

    clock = {
      interval = 60;
      format = "{:%a, %d, %b, %H:%M}";
      tooltip = true;
      tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
    };

    backlight = {
      format = "{icon}  {percent}%";
      format-icons = ["" "" "" "" "" "" "" "" ""];
    };

    memory = {
      format = "   {used}";
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

    pulseaudio = {
      format = "{icon}   {volume}%";
      format-muted = "󰝟";
      on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
      on-click-right = "pwvucontrol";
      format-icons = ["" "" "" "" ""];
    };

    battery = {
      format = "{icon} {capacity}%";
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
      tooltip = true;
    };
  };
}
