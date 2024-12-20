{ pkgs, inputs, ... }:
{
  # ------------------------------------------------
  # Needed Packages
  # ------------------------------------------------

  home.packages = with pkgs; [

    swaybg
    hyprshot
    hyprpicker

    wev
    wlr-randr
    wdisplays

    gpu-screen-recorder-gtk

    autotiling-rs

    playerctl
    brightnessctl
  ];

  # ------------------------------------------------
  # Sway Config
  # ------------------------------------------------

  wayland.windowManager.sway = {
    enable = true;
    xwayland = false;
    swaynag.enable = true;
    systemd.enable = true;
    wrapperFeatures.gtk = true;

    # ------------------------------------------------
    # Envirronement variables
    # ------------------------------------------------

    extraSessionCommands = ''
     
      export DISABLE_QT5_COMPAT=1
      export QT_QPA_PLATFORM="wayland"
      export QT_AUTO_SCREEN_SCALE_FACTOR=1
      export QT_WAYLAND_DISABLE_WINDOWDECORATION=1

      export MOZ_ENABLE_WAYLAND=1
      export NIXOS_OZONE_WL=1
      export ELECTRON_OZONE_PLATFORM_HINT="auto"

      export GTK_WAYLAND_DISABLE_WINDOWDECORATION=1 '';

    # ------------------------------------------------
    # Configuration
    # ------------------------------------------------

    extraConfig = '' 
      set $mod  mod4
      set $alt  mod1

      set $terminal   footclient
      set $browser   librewolf
      set $launcher     wofi
      set $file-manager  nautilus
      set $Tfile-manager  $terminal -e yazi
      set $audio-manager  com.saivert.pwvucontrol
      set $password-manager  org.keepassxc.KeePassXC
      set $bluetooth-manager  io.github.kaii_lb.Overskride

      default_border pixel 2

     '';

    config = {

      bars = [ ];
      colors.focused = {
        background = "#CAD4F5";
        border = "#CAD4F5";
        childBorder = "#CAD4F5";
        indicator = "#CAD4F5";
        text = "#CAD4F5";
      };
      defaultWorkspace = "workspace number 1";

      # ------------------------------------------------
      # Startup
      # ------------------------------------------------

      startup = [
        { command = "waybar"; }
        { command = "foot --server"; }
        { command = "autotiling-rs"; }
        { command = "swaybg -i ~/Dotfiles/home/wallpapers/nixppuccin.png -m fill"; }
      ];

      # ------------------------------------------------
      # Monitors
      # ------------------------------------------------

      output = {
        "eDP-1" = {
          resolution = "2880x1800";
          adaptive_sync = "on";
          position = "0,0";
          scale = "1.5";
        };
        "HDMI-A-1" = {
          resolution = "1920x1080";
          position = "1920,0";
        };
      };

      # ------------------------------------------------
      # Inputs
      # ------------------------------------------------

      input = {
        "type:touchpad" = {
          dwt = "enabled";
          tap = "enabled";
          natural_scroll = "enabled";
        };
      };

      # ------------------------------------------------
      # Window Rules
      # ------------------------------------------------

      assigns = {
        "1" = [{ class = "^librewolf$"; }];
        "2" = [{ class = "^org.pwmt.zathura$"; }];
        "3" = [{ class = "^codium$"; }];
        "4" = [{ class = "^whatsapp-for-linux$"; }];
        "5" = [{ class = "^Freetube$"; }];
      };

      # ------------------------------------------------
      # Workspace Rules
      # ------------------------------------------------

      # workspace1output = "eDP-1";
      # "workspace 2 output" = "eDP-1";
      # "workspace 3 output" = "eDP-1";
      # "workspace 4 output" = "eDP-1";
      # "workspace 5 output" = "eDP-1";


      # ------------------------------------------------
      # Keybindings
      # ------------------------------------------------

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
        "mod4+Control+Shift+s" = "exec hyprshot -m output";

        # Multimedia
        "XF86AudioRaiseVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+ -l 1";
        "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-";
        "XF86MonBrightnessUp" = "exec brightnessctl -q s 5%+";
        "XF86MonBrightnessDown" = "exec brightnessctl -q s 5%-";

        # System
        "mod4+q" = "kill";
        "mod4+t" = "floating toggle";
        "mod4+f" = "fullscreen toggle";

        # Window
        "mod4+h" = "focus left";
        "mod4+l" = "focus right";
        "mod4+k" = "focus up";
        "mod4+j" = "focus down";

        "mod4+Control+h" = "resize shrink width 5 px or 5 ppt";
        "mod4+Control+l" = "resize grow width 5 px or 5 ppt";
        "mod4+Control+k" = "resize shrink height 5 px or 5 ppt";
        "mod4+Control+j" = "resize grow height 5 px or 5 ppt";

        # Switch workspaces with mainMod + [0-9]
        "mod4+1" = "workspace number 1";
        "mod4+2" = "workspace number 2";
        "mod4+3" = "workspace number 3";
        "mod4+4" = "workspace number 4";
        "mod4+5" = "workspace number 5";
        "mod4+6" = "workspace number 6";
        "mod4+7" = "workspace number 7";
        "mod4+8" = "workspace number 8";
        "mod4+9" = "workspace number 9";
        "mod4+0" = "workspace  number 10";

        # Switch workspaces with mainMod + [0-9]
        "mod4+Shift+1" = "move container to workspace number 1";
        "mod4+Shift+2" = "move container to workspace number 2";
        "mod4+Shift+3" = "move container to workspace number 3";
        "mod4+Shift+4" = "move container to workspace number 4";
        "mod4+Shift+5" = "move container to workspace number 5";
        "mod4+Shift+6" = "move container to workspace number 6";
        "mod4+Shift+7" = "move container to workspace number 7";
        "mod4+Shift+8" = "move container to workspace number 8";
        "mod4+Shift+9" = "move container to workspace number 9";
        "mod4+Shift+0" = " move container to workspace number 10";
      };
    };
  };
}



