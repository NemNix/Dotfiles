{
  inputs,
  config,
  pkgs,
  ...
}: {
  # ----------------------------------------------------
  # HM settings
  # ----------------------------------------------------

  imports = [
    ../../../home
  ];
  # ----------------------------------------------------
  # HM packages
  # ----------------------------------------------------
  home.packages = with pkgs; [
    android-tools

    inputs.alejandra.defaultPackage.${system}

    universal-android-debloater
    hyprpanel
    nwg-displays

    spotube
    # SYSTEM
    killall
    nautilus
    kitty
    git
    #networkmanagerapplet              # Wifi
    #blueman                           # Bluetooth
    pwvucontrol # Sound
    overskride
    # MEDIA
    #mpv                               # Video
    #imv                               # Image
    #grim                              # Screen
    #slurp                             # Shot
    #wl-clipboard                      # Clipboard

    # APPS
    #jan                               # AI
    vesktop # Discord
    vscodium # Code editor
    keepassxc # Password
    protonvpn-cli_2 # VPN
  ];

  # ----------------------------------------------------
  # Programs config
  # ----------------------------------------------------

  # ----------------------------------------------------
  # Rice
  # ----------------------------------------------------

  # GTK

  gtk.iconTheme.package = pkgs.papirus-icon-theme;
  gtk.iconTheme.name = "Papirus-Dark";
}
