{ pkgs, inputs, ... }:
{
  # ------------------------------------------------
  # Needed Packages
  # ------------------------------------------------

  home.packages = with pkgs; [

    hyprshot
    hyprpicker
    inputs.hyprpolkitagent.packages."${pkgs.system}".hyprpolkitagent

    xdg-desktop-portal-hyprland

    wev
    wlr-randr
    wdisplays

    gpu-screen-recorder-gtk

    playerctl
    brightnessctl
  ];

  # ------------------------------------------------
  # Hyprland Config
  # ------------------------------------------------

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = false;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;

    # ------------------------------------------------
    # Configuration
    # ------------------------------------------------

    settings = {

      "$mod" = "SUPER";
      "$Alt_L" = "ALT";
      "$shiftMod" = "SUPER_SHIFT";

      # App
      "$terminal" = "footclient";
      "$browser" = "librewolf";
      "$launcher" = "wofi -S drun -I";
      "$file-manager" = "nautilus";
      "$Tfile-manager" = "$terminal -e yazi";
      "$audio-manager" = "com.saivert.pwvucontrol";
      "$password-manager" = "org.keepassxc.KeePassXC";
      "$bluetooth-manager" = "io.github.kaii_lb.Overskride";

      # ------------------------------------------------
      # Envirronement variables
      # ------------------------------------------------

      env = [
        "TERMINAL                            , $terminal "
        "XDG_SESSION_TYPE                    ,  wayland  "
        "XDG_CURRENT_DESKTOP                 ,  Hyprland "
        "XDG_SESSION_DESKTOP                 ,  Hyprland "

        "DISABLE_QT5_COMPAT                  , 1         "
        "QT_QPA_PLATFORM                     ,  wayland  "
        "QT_AUTO_SCREEN_SCALE_FACTOR         , 1         "
        "QT_WAYLAND_DISABLE_WINDOWDECORATION , 1         "

        "MOZ_ENABLE_WAYLAND                  , 1         "
        "NIXOS_OZONE_WL                      , 1         "
        "ELECTRON_OZONE_PLATFORM_HINT        , auto      "

        "GTK_WAYLAND_DISABLE_WINDOWDECORATION, 1         "
      ];

      # ------------------------------------------------
      # Startup
      # ------------------------------------------------

      exec-once = [
        "waybar"
        "foot --server"
        "systemctl --user start hyprpolkitagent"
      ];

      # ------------------------------------------------
      # Monitors
      # ------------------------------------------------

      monitor = [
        "eDP-1                      , 2880x1800@120 , auto       , 1.5"
        "desc:BOE Display 0x00000144, 2560x1440@144 , auto-left  , 1.25"
      ];

      # ------------------------------------------------
      # Window Rules
      # ------------------------------------------------

      windowrule = [
        "float       , ^($password-manager)$"
        "size 50% 40%, ^($password-manager)$"

        "float       , ^($bluetooth-manager)$"
        "size 50% 60%, ^($bluetooth-manager)$"

        "float       , ^($audio-manager)$"
        "size 50% 30%, ^($audio-manager)$"

        "noblur      , class:^(steam)"
        "forcergbx   , class:^(steam)"
      ];

      windowrulev2 = [
        "workspace 1,       class:($browser)"
        "workspace 2,       class:(org.pwmt.zathura)"
        "workspace 3,       class:(codium)"
        "workspace 4,       class:(vesktop)"
        "workspace 5,       class:(FreeTube)"
        "workspace special, class:(spotify)"
      ];

      # ------------------------------------------------
      # Workspace Rules
      # ------------------------------------------------

      workspace = [
        "1,  monitor:eDP-1, default:true"
        "2,  monitor:eDP-1"
        "3,  monitor:eDP-1, gapsin:0, bordersize:1"
        "4,  monitor:eDP-1"
        "5,  monitor:eDP-1"

        "6,  monitor:desc:BOE Display 0x00000144, default:true"
        "7,  monitor:desc:BOE Display 0x00000144"
        "8,  monitor:desc:BOE Display 0x00000144, gapsin:0, bordersize:1"
        "9,  monitor:desc:BOE Display 0x00000144"
        "10, monitor:desc:BOE Display 0x00000144"
      ];

      # ------------------------------------------------
      # Keybidings
      # ------------------------------------------------

      bind = [
        # Apps
        "ALT, code:10, exec, $browser"
        "ALT, code:11, exec, $file-manager"
        "ALT, code:12, exec, $Tfile-manager"

        # Window 
        "SUPER, H, movefocus, l"
        "SUPER, L, movefocus, r"
        "SUPER, K, movefocus, u"
        "SUPER, J, movefocus, d"

        "CONTROL&SUPER, H, resizeactive, -20 0"
        "CONTROL&SUPER, L, resizeactive, 20 0"
        "CONTROL&SUPER, K, resizeactive, 0 -20"
        "CONTROL&SUPER, J, resizeactive, 0 20"

        # System
        "SUPER, Q, killactive"
        "SUPER, F, fullscreen"
        "SUPER, T, togglefloating"

        "SUPER, R        , exec , $launcher"
        "SUPER, RETURN   , exec , $terminal"
        "SUPER, Backspace, exec , $terminal -F"

        # Screenshot
        "SUPER                 , S , exec , hyprshot -m region --clipboard-only"
        "CONTROL&SUPER         , S , exec , hyprshot -m region "
        "CONTROL&SUPER&SHIFT_L , S , exec , hyprshot -m output"

        # Switch workspaces with mainMod + [0-9]
        "SUPER, code:10, workspace, 6"
        "SUPER, code:10, workspace, 1"

        "SUPER, code:11, workspace, 7"
        "SUPER, code:11, workspace, 2"

        "SUPER, code:12, workspace, 8"
        "SUPER, code:12, workspace, 3"

        "SUPER, code:13, workspace, 9"
        "SUPER, code:13, workspace, 4"

        "SUPER, code:14, workspace, 10"
        "SUPER, code:14, workspace, 5"

        "SUPER, Escape, exec, hyprctl dispatch togglespecialworkspace"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "SUPER SHIFT, code:10, movetoworkspace,  1"
        "SUPER SHIFT, code:11, movetoworkspace,  2"
        "SUPER SHIFT, code:12, movetoworkspace,  3"
        "SUPER SHIFT, code:13, movetoworkspace,  4"
        "SUPER SHIFT, code:14, movetoworkspace,  5"
        "SUPER SHIFT, code:15, movetoworkspace,  6"
        "SUPER SHIFT, code:16, movetoworkspace,  7"
        "SUPER SHIFT, code:17, movetoworkspace,  8"
        "SUPER SHIFT, code:18, movetoworkspace,  9"
        "SUPER SHIFT, code:19, movetoworkspace, 10"
        "SUPER SHIFT, Escape,  movetoworkspace, special"
      ];

      bindm = [
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];

      bindl = [
        ", XF86AudioMute,     exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", switch:Lid Switch, exec, loginctl lock-session && systemctl suspend"
      ];

      bindle = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+ -l 1"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"

        ", XF86AudioPlay , exec , playerctl play-pause"
        ", XF86AudioStop , exec , playerctl pause"
        ", XF86AudioPrev , exec , playerctl previous"
        ", XF86AudioNext , exec , playerctl next"

        ", XF86MonBrightnessUp,   exec, brightnessctl -q s 5%+"
        ", XF86MonBrightnessDown, exec, brightnessctl -q s 5%-"
      ];

      # ------------------------------------------------
      # Sections
      # ------------------------------------------------

      debug = { watchdog_timeout = 0; };

      xwayland = { enabled = false; };
      opengl = { force_introspection = 1; };

      animations = { enabled = false; };
      decoration = { shadow = { enabled = false; }; blur = { enabled = false; }; };

      general = {
        gaps_in = 3;
        gaps_out = 0;
        border_size = 2;
        "col.active_border" = "rgb(F5A97F) rgb(ED8796) rgb(C6A0F6) rgb(8AADF4) rgb(A6DA95) rgb(EED49F)";

        layout = "master";
      };

      dwindle = { pseudotile = true; };

      misc = {
        focus_on_activate = true;

        disable_autoreload = true;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };

      input = {
        kb_layout = "us";
        kb_variant = "";

        follow_mouse = 1;
        sensitivity = 0.4;
        accel_profile = "flat";

        touchpad = {
          scroll_factor = 0.5;
          natural_scroll = true;
        };
      };
    };
  };

  #################################
  # Hyprpaper
  #################################
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      preload = [ "~/Dotfiles/home/wallpapers/nixppuccin.png" ];
      wallpaper = [ ",~/Dotfiles/home/wallpapers/nixppuccin.png" ];
    };
  };

  #################################
  # Hypridle
  #################################
  services.hypridle = {
    enable = true;

    settings = {
      general = {
        ignore_dbus_inhibit = true;
        lock_cmd = "pidof hyprlock || hyprlock"; # avoid starting multiple hyprlock instances.
        before_sleep_cmd = "loginctl lock-session"; # lock before suspend.
        after_sleep_cmd = "hyprctl dispatch dpms on"; # to avoid having to press a key twice to turn on the display.
      };

      listener = [
        {
          timeout = 80;
          on-timeout = "brightnessctl -s set 0";
          on-resume = "brightnessctl -r";
        }
        {
          timeout = 150;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };

  #################################
  # Hyprlock
  #################################
  programs.hyprlock = {
    enable = true;

    settings = {

      general = {
        grace = 5;
        no_fade_in = true;
        no_fade_out = true;
        disable_loading_bar = false;
      };

      input-field = {
        size = "100%, 100%";
        outline_thickness = 3;

        fade_on_empty = false;
        rounding = 15;

        position = "0, -40";
        halign = "center";
        valign = "center";
      };
    };
  };
}
