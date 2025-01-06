{ pkgs, ... }:
{
  # ------------------------------------------------
  # Needed Packages
  # ------------------------------------------------

  home.packages = with pkgs; [

    swaybg
    autotiling-rs

    hyprshot
    hyprpicker

    wlay
    wlr-randr

    playerctl
    brightnessctl

    xdg-desktop-portal-wlr

  ];

  # ================================================================================================
  # Sway 
  # ================================================================================================

  wayland.windowManager.sway = {
    enable = true;
    xwayland = false;
    systemd.enable = true;

    # ------------------------------------------------
    # Session variables
    # ------------------------------------------------

    extraSessionCommands = ''

      export DISABLE_QT5_COMPAT=1
      export QT_QPA_PLATFORM="wayland"
      export QT_AUTO_SCREEN_SCALE_FACTOR=1
      export QT_WAYLAND_DISABLE_WINDOWDECORATION=1

      export NIXOS_OZONE_WL=1
      export MOZ_ENABLE_WAYLAND=1
      export ELECTRON_OZONE_PLATFORM_HINT="auto"

      export GTK_WAYLAND_DISABLE_WINDOWDECORATION=1 '';

    # ------------------------------------------------
    # Configuration
    # ------------------------------------------------

    extraConfig = '' 

      set $terminal   footclient
      set $browser   librewolf
      set $launcher     anyrun
      set $file-manager  nautilus
      set $Tfile-manager  $terminal -e yazi
      set $audio-manager  com.saivert.pwvucontrol
      set $password-manager  org.keepassxc.KeePassXC
      set $bluetooth-manager  io.github.kaii_lb.Overskride '';

    config = {
      focus.newWindow = "focus";
      floating.modifier = "mod4";
      defaultWorkspace = "workspace number 1";

      # ------------------------------------------------
      # Startup
      # ------------------------------------------------

      startup = [
        { command = "waybar"; }
        { command = "foot --server"; }
        { command = "autotiling-rs"; }
        { command = "swaybg -i ~/Dotfiles/home/wallpapers/nixos-wallpaper.png"; }
        { command = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"; }
      ];

      # ------------------------------------------------
      # Monitors
      # ------------------------------------------------

      output = {

        eDP-1 = {
          scale = "1.5";
          resolution = "2880x1800";

          adaptive_sync = "on";
          max_render_time = "off";

          subpixel = "rgb";
          color_profile = "srgb";
          render_bit_depth = "10";
        };

        HDMI-A-1 = {
          scale = "1.25";
          position = "-1920,0";
          resolution = "2560x1440";

          adaptive_sync = "off";
          max_render_time = "off";
        };
      };

      # ------------------------------------------------
      # Inputs
      # ------------------------------------------------

      input = {

        "type:touchpad" = {
          dwt = "enabled";
          tap = "enabled";
          pointer_accel = "1";
          accel_profile = "flat";
          natural_scroll = "enabled";
        };

        "type:mouse" = {
          pointer_accel = "0.4";
          accel_profile = "flat";
        };
      };

      # ------------------------------------------------
      # Window Rules
      # ------------------------------------------------

      assigns = {
        "1" = [{ app_id = "^librewolf$"; }];
        "2" = [{ app_id = "^org.pwmt.zathura$"; }];
        "3" = [{ app_id = "^codium$"; }];
        "4" = [{ app_id = "^wasistlos$"; }];
        "5" = [{ app_id = "^FreeTube$"; }];
      };

      # ------------------------------------------------
      # Workspace Rules
      # ------------------------------------------------

      workspaceOutputAssign = [
        { workspace = "1"; output = "eDP-1"; }
        { workspace = "2"; output = "eDP-1"; }
        { workspace = "3"; output = "eDP-1"; }
        { workspace = "4"; output = "eDP-1"; }
        { workspace = "5"; output = "eDP-1"; }

        { workspace = "6"; output = "HDMI-A-1"; }
        { workspace = "7"; output = "HDMI-A-1"; }
        { workspace = "8"; output = "HDMI-A-1"; }
        { workspace = "9"; output = "HDMI-A-1"; }
        { workspace = "10"; output = "HDMI-A-1"; }
      ];

      # ------------------------------------------------
      # Keybindings
      # ------------------------------------------------

      keycodebindings = {
        # Switch workspaces with mainMod + [0-5]
        "mod4+10" = "workspace number 6, workspace number 1";
        "mod4+11" = "workspace number 7, workspace number 2";
        "mod4+12" = "workspace number 8, workspace number 3";
        "mod4+13" = "workspace number 9, workspace number 4";
        "mod4+14" = "workspace number 10, workspace number 5";

        # Switch workspaces with mainMod + [0-9]
        "mod4+Shift+10" = "move container to workspace number 1";
        "mod4+Shift+11" = "move container to workspace number 2";
        "mod4+Shift+12" = "move container to workspace number 3";
        "mod4+Shift+13" = "move container to workspace number 4";
        "mod4+Shift+14" = "move container to workspace number 5";
        "mod4+Shift+15" = "move container to workspace number 6";
        "mod4+Shift+16" = "move container to workspace number 7";
        "mod4+Shift+17" = "move container to workspace number 8";
        "mod4+Shift+18" = "move container to workspace number 9";
        "mod4+Shift+19" = "move container to workspace number 10";
      };

      keybindings = {

        # Apps 
        "mod1+1" = "exec $browser";
        "mod4+r" = "exec $launcher";
        "mod1+2" = "exec $file-manager";
        "mod1+3" = "exec $Tfile-manager";
        "mod4+Return" = "exec $terminal";

        # Screenshot
        "mod4+s" = "exec hyprshot -m region --clipboard-only";
        "mod4+Control+s" = "exec hyprshot -m region";
        "mod4+Control+mod1+s" = "exec hyprshot -m output";

        # Multimedia
        "XF86MonBrightnessUp" = "exec brightnessctl -q s 5%+";
        "XF86MonBrightnessDown" = "exec brightnessctl -q s 5%-";
        "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-";
        "XF86AudioRaiseVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+ -l 1";

        # System
        "mod4+q" = "kill";
        "mod4+t" = "floating toggle";
        "mod4+f" = "fullscreen toggle";
        "mod4+Shift+r" = "exec notify-send --urgency=critical 'Sway Restart', restart";
        "mod4+Shift+e" = "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -b 'Yes, exit sway' 'swaymsg exit'";

        "mod4+Shift+Control+r" = "exec systemctl reboot";
        "mod4+Shift+Control+s" = "exec systemctl suspend";
        "mod4+Shift+Control+p" = "exec systemctl poweroff";

        # Window
        "mod4+h" = "focus left";
        "mod4+l" = "focus right";
        "mod4+k" = "focus up";
        "mod4+j" = "focus down";

        "mod4+Shift+h" = "move left";
        "mod4+Shift+l" = "move right";
        "mod4+Shift+k" = "move up";
        "mod4+Shift+j" = "move down";

        "mod4+Control+h" = "resize shrink width 20 px ";
        "mod4+Control+l" = "resize grow width 20 px ";
        "mod4+Control+k" = "resize shrink height 20 px ";
        "mod4+Control+j" = "resize grow height 20 px ";

      };

      # ------------------------------------------------
      # Style
      # ------------------------------------------------

      bars = [ ];

      gaps = {
        # inner = 0;
        # outer = 0;
        # right = 0;
        # left = 0;
        # smartGaps = true;
        smartBorders = "on";
      };

      window = {
        border = 2;
        titlebar = false;
      };

      colors = {
        focused = {
          background = "#CAD4F5";
          border = "#CAD4F5";
          childBorder = "#CAD4F5";
          indicator = "#CAD4F5";
          text = "#CAD4F5";
        };

        unfocused = {
          background = "#1E1E2E";
          border = "#1E1E2E";
          childBorder = "#1E1E2E";
          indicator = "#1E1E2E";
          text = "#1E1E2E";
        };

        focusedInactive = {
          background = "#1E1E2E";
          border = "#1E1E2E";
          childBorder = "#1E1E2E";
          indicator = "#1E1E2E";
          text = "#1E1E2E";
        };
      };
    };
  };

  # ================================================================================================
  # SwayIDLE
  # ================================================================================================

  services.swayidle = {
    enable = true;
    timeouts = [
      { timeout = 60; command = "${pkgs.brightnessctl}/bin/brightnessctl -s set 0"; resumeCommand = "${pkgs.brightnessctl}/bin/brightnessctl -r"; }
      { timeout = 90; command = "${pkgs.swaylock}/bin/swaylock -fF"; }
      { timeout = 120; command = "${pkgs.systemd}/bin/systemctl suspend"; }
      { timeout = 1800; command = "${pkgs.systemd}/bin/systemctl poweroff"; }
    ];
  };

  # ================================================================================================
  # SwayLOCK
  # ================================================================================================

  programs.swaylock = {
    enable = true;
    settings = { indicator-caps-lock = true; };
  };
}



