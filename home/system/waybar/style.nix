{
  programs.waybar.style = ''
      * {
        font-family: "nerdfonts";
        font-weight: 800;
    }

    window#waybar {
        background: transparent;
        color: #ffffff;
    }

    #workspaces {
        font-size : 15;
        font-weight: 700;
        background: @theme_base_color;
        border: 3px solid #8caaee;
        border-radius: 10px;
        margin-left: 2px;
    }

    #tray {
        background: @theme_base_color;
        border: 3px solid #8caaee;
        border-radius: 10px;
        padding-left: 3px;
        padding-right: 3px;
    }

    #bluetooth,
    #idle_inhibitor {
        font-size : 18;
        background: @theme_base_color;
        border: 3px solid #8caaee;
        border-radius: 10px;
        padding-right: 10px;
        padding-left: 10px;
    }

    #clock {
        font-size : 14;
        background: @theme_base_color;
        border: 3px solid #8caaee;
        border-radius: 10px;
        padding-right: 20px;
        padding-left: 20px;
    }

    #backlight,
    #memory,
    #cpu,
    #network,
    #pulseaudio {
        font-size : 14;
        background: @theme_base_color;
        border: 3px solid #8caaee;
        border-radius: 10px;
        padding-right: 10px;
        padding-left: 10px;
    }

    #battery {
        font-size : 14;
        background: @theme_base_color;
        border: 3px solid #8caaee;
        border-radius: 10px;
        padding-right: 10px;
        padding-left: 10px;
        margin-right: 2px;
        color: #a6e3a1;
    }

    #battery.critical:not(.charging) {
        color: #f38ba8;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: steps(12);
        animation-iteration-count: infinite;
        animation-direction: alternate;
    }

    #cpu {
        color: #eba0ac;
    }

    #memory {
        color: #f5c2e7;
    }

    #network {
        color: #b4befe;
    }

    #pulseaudio {
        color: #74c7ec;
    }

    #backlight {
        color: #f9e2af;
    }

  '';
}
