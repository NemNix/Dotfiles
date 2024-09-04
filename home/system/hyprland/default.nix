{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./hypridle.nix
    ./hyprlock.nix
    ./hyprpaper.nix
  ];

  # ------------------------------------------------
  # Needed Packages
  # ------------------------------------------------

  home.packages = with pkgs; [
    hyprshot

    wlsunset
    wlr-randr
    wl-clipboard

    brightnessctl

    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
  ];

  # ------------------------------------------------
  # Hyprland Config
  # ------------------------------------------------

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    # ------------------------------------------------
    # Configuration
    # ------------------------------------------------

    settings = {
      "$mod" = "SUPER";
      "$shiftMod" = "SUPER_SHIFT";
      "$Alt_L" = "ALT";

      "$numberRow0" = "agrave";
      "$numberRow1" = "ampersand";
      "$numberRow2" = "eacute";
      "$numberRow3" = "quotedbl";
      "$numberRow4" = "apostrophe";
      "$numberRow5" = "parenleft";
      "$numberRow6" = "minus";
      "$numberRow7" = "egrave";
      "$numberRow8" = "underscore";
      "$numberRow9" = "ccedilla";

      # ------------------------------------------------
      # Envirronement variables
      # ------------------------------------------------

      env = [
        "XDG_SESSION_TYPE,wayland"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "MOZ_ENABLE_WAYLAND,1"
        "ANKI_WAYLAND,1"
        "DISABLE_QT5_COMPAT,1"
        "NIXOS_OZONE_WL,1"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "QT_QPA_PLATFORM=wayland,xcb"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"

        # "AQ_DRM_DEVICES,/dev/dri/card0:/dev/dri/card1"
      ];

      # ------------------------------------------------
      # Startup
      # ------------------------------------------------

      exec-once = [
        "waybar"
      ];

      # ------------------------------------------------
      # Monitors
      # ------------------------------------------------

      monitor = [
        "eDP-1, 1920x1080@144.00, auto, 1"
        "DP-1 , highrr, auto-right ,1"
      ];

      # ------------------------------------------------
      # Keybidings
      # ------------------------------------------------

      bind = [
        # Apps
        "SUPER, RETURN, exec, kitty"
        "ALT, ampersand, exec, librewolf"
        "ALT, eacute, exec, kitty -e yazi"
        "ALT, quotedbl, exec, kitty -e nvim"

        # System
        "SUPER, X, exec, powermenu"
        "SUPER, R, exec, wofi -S drun -I"
        "SUPER, L, exec, hyprlock --immediate"

        "SUPER, W, killactive,"
        "SUPER, F, fullscreen"
        "SUPER, T, togglefloating,"

        # Multimédia
        "ALT, S , exec , hyprshot -m region --clipboard-only"
        "CONTROL&ALT , S , exec ,hyprshot -m region "
        "CONTROL&ALT&SHIFT_L , S , exec , hyprshot -m output"

        "SUPER, F2, exec, night-shift-off" # Turn off night shift
        "SUPER, F3, exec, night-shift-on" # Turn on night shift

        # Window Focus
        "SUPER, q, movefocus, l"
        "SUPER, d, movefocus, r"
        "SUPER, z, movefocus, u"
        "SUPER, s, movefocus, d"

        # Switch workspaces with mainMod + [0-9]
        "SUPER, $numberRow1      , workspace,  1"
        "SUPER, $numberRow2      , workspace,  2"
        "SUPER, $numberRow3      , workspace,  3"
        "SUPER, $numberRow4      , workspace,  4"
        "SUPER, $numberRow5      , workspace,  5"
        "SUPER, $numberRow6      , workspace,  6"
        "SUPER, $numberRow7      , workspace,  7"
        "SUPER, $numberRow8      , workspace,  8"
        "SUPER, $numberRow9      , workspace,  9"
        "SUPER, $numberRow0      , workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "SUPER SHIFT, $numberRow1  , movetoworkspace,  1"
        "SUPER SHIFT, $numberRow2  , movetoworkspace,  2"
        "SUPER SHIFT, $numberRow3  , movetoworkspace,  3"
        "SUPER SHIFT, $numberRow4  , movetoworkspace,  4"
        "SUPER SHIFT, $numberRow5  , movetoworkspace,  5"
        "SUPER SHIFT, $numberRow6  , movetoworkspace,  6"
        "SUPER SHIFT, $numberRow7  , movetoworkspace,  7"
        "SUPER SHIFT, $numberRow8  , movetoworkspace,  8"
        "SUPER SHIFT, $numberRow9  , movetoworkspace,  9"
        "SUPER SHIFT, $numberRow0  , movetoworkspace, 10"
      ];

      bindm = [
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];

      bindl = [
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",switch:Lid Switch, exec, ${pkgs.hyprlock}/bin/hyprlock"
      ];

      bindle = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"
        ", XF86MonBrightnessUp, exec, brightnessctl -q s 5%+"
        ", XF86MonBrightnessDown, exec, brightnessctl -q s 5%-"
        ", XF86kbdBrightnessDown, exec, brightnessctl -q s 5%-"
        ", XF86kbdBrightnessDown, exec, brightnessctl -q s 5%-"
      ];

      # ------------------------------------------------
      # Sections
      # ------------------------------------------------

      general = {
        gaps_in = 5;
        gaps_out = 0;
        border_size = 3;

        resize_on_border = true;
        no_border_on_floating = true;

        layout = "dwindle";
      };

      master = {
        new_status = true;
      };

      misc = {
        vfr = true;
        vrr = 1;

        disable_autoreload = true;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;

        focus_on_activate = true;
        new_window_takes_over_fullscreen = 2;
      };

      render = {
        explicit_sync = 2;
      };

      input = {
        kb_layout = "fr";

        follow_mouse = 1;
        sensitivity = 0.5;
        repeat_delay = 300;
        repeat_rate = 50;

        touchpad = {
          natural_scroll = true;
          clickfinger_behavior = true;
          disable_while_typing = true;
        };
      };

      gestures = {
        workspace_swipe = true;
      };

      decoration = {
        rounding = 7;
        drop_shadow = false;

        blur = {
          enabled = false;
        };
      };

      animations = {
        enabled = false;
      };
    };
  };
}
