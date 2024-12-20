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

  wayland.windowManager.sway = {
    enable = true;
    swaynag.enable = true;
    systemd.enable = true;
    xwayland.enable = false;

    # ------------------------------------------------
    # Configuration
    # ------------------------------------------------

    extraConfig = '' 
    set $MOD = mod4
    set $ALT = mod1

    set $terminal = footclient
    set $browser = librewolf
    set $launcher = wofi -S drun -I
    set $file-manager = nautilus
    set $Tfile-manager = $terminal -e yazi
    set $audio-manager = com.saivert.pwvucontrol
    set $password-manager = org.keepassxc.KeePassXC
    set $bluetooth-manager = io.github.kaii_lb.Overskride
    '';


    config = {

      # ------------------------------------------------
      # Startup
      # ------------------------------------------------

      startup = [
        { command = "waybar"; }
        { command = "foot --server"; }
      ];

      # ------------------------------------------------
      # Monitors
      # ------------------------------------------------

      output = {
        "eDP-1" = {
          resolution = "2880x1800";
          position = "0,0";
          scale = "1.5";
        };
        "HDMI-A-1" = {
          resolution = "1920x1080";
          position = "1920,0";
        };
      };


      keybindings = {
        "MOD+Return" = "exec ${pkgs.foot}/bin/foot";
        "MOD+q" = "kill";
        "MOD+r" = "exec launcher";
      };

    };
  };
}

