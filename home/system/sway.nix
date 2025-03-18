{ pkgs, ... }:
{
  # ================================================================================================
  # Environment config
  # ================================================================================================

  home = {
    packages = with pkgs; [

      swaybg
      swaylock
      swayidle

      autotiling-rs
      wl-color-picker
      sway-contrib.grimshot

      wdisplays
      wlr-randr
      wl-gammactl

      playerctl
      brightnessctl

      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk

    ];

    sessionVariables = {
      XDG_SESSION_TYPE = "wayland";
      XDG_CURRENT_DESKTOP = "sway";
      XDG_SESSION_DESKTOP = "sway";

      DISABLE_QT5_COMPAT = 1;
      QT_QPA_PLATFORM = "wayland";
      QT_AUTO_SCREEN_SCALE_FACTOR = 1;
      QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;

      NIXOS_OZONE_WL = 1;
      MOZ_ENABLE_WAYLAND = 1;
      ELECTRON_OZONE_PLATFORM_HINT = 1;

      GTK_WAYLAND_DISABLE_WINDOWDECORATION = 1;

      # better fonts:
      # https://web.archive.org/web/20230921201835/https://old.reddit.com/r/linux_gaming/comments/16lwgnj/is_it_possible_to_improve_font_rendering_on_linux/
      FREETYPE_PROPERTIES = "cff:no-stem-darkening=0 autofitter:no-stem-darkening=0";

    };
  };

  # ================================================================================================
  # Sway 
  # ================================================================================================

  wayland.windowManager.sway = {
    enable = true;
    xwayland = false;

    systemd = {
      enable = false;
      # variables = [ ];
    };

    wrapperFeatures = {
      gtk = true;
      base = true;
    };

    # ------------------------------------------------
    # Configuration
    # ------------------------------------------------

    extraConfig = ''
      set $launcher           anyrun
      set $browser            librewolf
      set $terminal           footclient
      set $file-manager       nautilus
      set $Tfile-manager      $terminal -e yazi
      set $audio-manager      com.saivert.pwvucontrol
      set $password-manager   org.keepassxc.KeePassXC
      set $bluetooth-manager  io.github.kaii_lb.Overskride '';

    config = {

      # ------------------------------------------------
      # Startup
      # ------------------------------------------------

      startup = [
        { command = "fnott -s"; }
        { command = "foot --server"; }
        { command = "autotiling-rs"; }
        { command = "wl-gammactl -c 1.000 -b 0.950 -g 0.825"; }
        { command = "swaybg -i ~/Dotfiles/home/wallpapers/nixos-mocha.png"; }
        { command = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"; }
        {
          command = ''
            swayidle -w \
            before-sleep  "swaylock -fF" \
            timeout 60 "brightnessctl -s set 0" resume "brightnessctl -r" \
            timeout 120 "systemctl suspend" \
            timeout 1800 "systemctl poweroff" '';
        }
      ];

      # ------------------------------------------------
      # Monitors
      # ------------------------------------------------

      output = {

        eDP-1 = {
          scale = "1.5";
          scale_filter = "nearest";
          resolution = "2880x1800";

          adaptive_sync = "on";
          max_render_time = "off";

          subpixel = "rgb";
          render_bit_depth = "10";
          color_profile = "srgb";
          # color_profile = "icc /home/nem/Dotfiles/home/system/LAPTOP.icc";
        };

        HDMI-A-1 = {
          scale = "1.25";
          scale_filter = "nearest";
          position = "-1920,0";
          resolution = "2560x1440";

          adaptive_sync = "off";
          max_render_time = "off";

          subpixel = "rgb";
          color_profile = "srgb";
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
      # Window
      # ------------------------------------------------

      window = {
        border = 2;
        titlebar = false;

        commands = [{
          command = "inhibit_idle fullscreen";
          criteria = { app_id = ".*"; };
        }];
      };

      floating = {
        border = 2;
        titlebar = false;

        modifier = "mod4";
        criteria = [
          { app_id = "^yazi$"; }
          { app_id = "^com.saivert.pwvucontrol$"; }
          { app_id = "^io.github.kaii_lb.Overskride$"; }
        ];
      };

      # ------------------------------------------------
      # Window Rules
      # ------------------------------------------------

      assigns = {
        "1" = [{ app_id = "^librewolf$"; }];
        "2" = [{ app_id = "^org.pwmt.zathura$"; }];
        "3" = [{ app_id = "^codium$"; } { app_id = "^rstudio$"; }];
        "4" = [{ app_id = "^com.rtosta.zapzap$"; }];
        "5" = [{ app_id = "^FreeTube"; } { app_id = "^chrome-netflix.com__-Default$"; }];
      };

      # ------------------------------------------------
      # Workspace Rules
      # ------------------------------------------------

      workspaceAutoBackAndForth = true;
      defaultWorkspace = "workspace number 1";

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
        # Switch workspaces with mainMod + [0-9]
        "mod4+9" = "scratchpad show";
        "mod4+10" = "workspace number 1";
        "mod4+11" = "workspace number 2";
        "mod4+12" = "workspace number 3";
        "mod4+13" = "workspace number 4";
        "mod4+14" = "workspace number 5";
        "mod4+15" = "workspace number 6";
        "mod4+16" = "workspace number 7";
        "mod4+17" = "workspace number 8";
        "mod4+18" = "workspace number 9";
        "mod4+19" = "workspace number 10";

        # Switch workspaces with mainMod + [0-9]
        "mod4+Shift+9" = "move scratchpad";
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
        "mod4+s" = "exec grimshot --notify copy anything";
        "mod4+Control+s" = "exec grimshot --notify save anything";
        "mod4+Control+mod1+s" = "exec grimshot --notify save screen";

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

        "mod4+Shift+e" = "exec swaymsg exit";
        "mod4+Shift+r" = "exec swaymsg reload";
        "mod4+i" = "exec swaymsg inhibit_idle open";

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

        "mod4+Control+h" = "resize shrink width 10 px ";
        "mod4+Control+l" = "resize grow width 10 px ";
        "mod4+Control+k" = "resize shrink height 10 px ";
        "mod4+Control+j" = "resize grow height 10 px ";

      };

      # ------------------------------------------------
      # Style
      # ------------------------------------------------

      gaps = {
        # inner = 10;
        # outer = 0;
        # right = 0;
        # left = 0;
        # top = 0;
        # bottom = 0;
        # vertical = 0;
        # horizontal = 0;
        # # smartGaps = true;
        smartBorders = "on";
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

      bars = [{

        position = "top";
        trayPadding = 0;
        statusCommand = "${pkgs.i3status}/bin/i3status";

        extraConfig = ''
          output eDP-1
          separator_symbol ""
        '';

        fonts = {
          names = [ "DroidSansM Nerd Font" ];
          style = "Regular";
          size = 11.0;
        };

        colors = {
          separator = "#1e1e2e";
          background = "#1e1e2e";

          focusedWorkspace = {
            text = "#1e1e2e";
            border = "#fab387";
            background = "#fab387";
          };

          activeWorkspace = {
            text = "#1e1e2e";
            border = "#eba0ac";
            background = "#eba0ac";
          };

          urgentWorkspace = {
            text = "#1e1e2e";
            border = "#74c7ec";
            background = "#74c7ec";
          };
        };
      }];
    };
  };
}



