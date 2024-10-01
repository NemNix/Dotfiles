{
  pkgs,
  config,
  inputs,
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
    hyprpicker

    wlr-randr
    wdisplays
    playerctl
    brightnessctl

    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
  ];

  # ------------------------------------------------
  # Hyprland Config
  # ------------------------------------------------

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    xwayland.enable = true;

    # ------------------------------------------------
    # Configuration
    # ------------------------------------------------

    settings = {
      "$mod" = "SUPER";
      "$shiftMod" = "SUPER_SHIFT";
      "$Alt_L" = "ALT";

      "$numberRow1" = "code:10";
      "$numberRow2" = "code:11";
      "$numberRow3" = "code:12";
      "$numberRow4" = "code:13";
      "$numberRow5" = "code:14";
      "$numberRow6" = "code:15";
      "$numberRow7" = "code:16";
      "$numberRow8" = "code:17";
      "$numberRow9" = "code:18";

      # App

      "$terminal" = "kitty";
      "$browser" = "zen-bin";
      "$file-manager" = "nautilus";
      "$launcher" = "wofi -S drun -I";
      "$Tfile-manager" = "$terminal -e yazi";
      "$audio-manager" = "com.saivert.pwvucontrol";
      "$password-manager" = "org.keepassxc.KeePassXC";
      "$bluetooth-manager" = "io.github.kaii_lb.Overskride";

      # ------------------------------------------------
      # Envirronement variables
      # ------------------------------------------------

      env = [
        "XDG_SESSION_TYPE,wayland"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "NIXOS_OZONE_WL,1"
        "QT_QPA_PLATFORM,wayland"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "GTK_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"

        #"AQ_DRM_DEVICES,/dev/dri/card1:/dev/dri/card0"
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
        "DP-1 , highrr, auto-right, 1, transform, 3 "
      ];

      # ------------------------------------------------
      # Window Rules
      # ------------------------------------------------

      windowrule = [
        "float, ^($terminal)$"
        "size 45% 45%,^($terminal)$"

        "float, ^(foot)$"
        "size 45% 45%,^(foot)$"

        "float, ^($password-manager)$"
        "size 50% 60%,^($password-manager)$"

        "float, ^($bluetooth-manager)$"
        "size 50% 60%,^($bluetooth-manager)$"

        "float,  ^($audio-manager)$"
        "size 50% 30%,^($audio-manager)$"

        # Steam
        "noblur,    class:^(steam)"
        "forcergbx, class:^(steam)" # Force rgbx color (needed if steam show strange coloration)
      ];

      # ------------------------------------------------
      # Keybidings
      # ------------------------------------------------

      bind = [
        # Apps

        "ALT, code:10, exec, $browser"
        "ALT, code:11, exec, $file-manager"
        "ALT, code:12, exec, $Tfile-manager"

        # System
        "SUPER, RETURN, exec,$terminal"
        "SUPER, X, exec, powermenu"
        "SUPER, R, exec, $launcher"
        "SUPER, L, exec, hyprlock --immediate"

        "SUPER, W, killactive,"
        "SUPER, F, fullscreen"
        "SUPER, T, togglefloating,"

        # Screenshot
        "ALT, S , exec , hyprshot -m region --clipboard-only"
        "CONTROL&ALT , S , exec ,hyprshot -m region "
        "CONTROL&ALT&SHIFT_L , S , exec , hyprshot -m output"

        # Window Focus
        "SUPER, h, movefocus, l"
        "SUPER, l, movefocus, r"
        "SUPER, k, movefocus, u"
        "SUPER, j, movefocus, d"

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
        #",switch:Lid Switch, exec, pidof hyprlock || hyprlock"
      ];

      bindle = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"

        ", XF86MonBrightnessUp, exec, brightnessctl -q s 5%+"
        ", XF86MonBrightnessDown, exec, brightnessctl -q s 5%-"

        ", XF86kbdBrightnessDown, exec, brightnessctl -sd asus::kbd_backlight set 1-"
        ", XF86kbdBrightnessUp, exec, brightnessctl -sd asus::kbd_backlight set 1+"

        ", XF86AudioPlay , exec , playerctl play-pause"
        ", XF86AudioStop , exec , playerctl pause"
        ", XF86AudioPrev , exec ,  playerctl previous"
        ", XF86AudioNext , exec , playerctl next"
      ];

      # ------------------------------------------------
      # Sections
      # ------------------------------------------------

      general = {
        gaps_in = 5;
        gaps_out = 2;
        border_size = 3;

        resize_on_border = true;
        no_border_on_floating = false;

        layout = "dwindle";
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
        rounding = 10;
        drop_shadow = false;
        #inactive_opacity = 0.8;

        blur = {
          enabled = false;
          ignore_opacity = true;
        };
      };

      animations = {
        enabled = false;
      };
    };
  };
}
