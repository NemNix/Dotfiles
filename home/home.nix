{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./programs/git
    ./programs/btop
    ./programs/yazi
    ./programs/foot
    ./programs/kitty
    ./programs/shell
    ./programs/fetch
    ./programs/vscodium
    #./programs/chromium
    #./programs/vesktop
    ./programs/freetube
    ./programs/spicetify
    #./programs/librewolf

    ./system/wofi
    ./system/dunst
    ./system/stylix
    ./system/waybar
    #./system/mime/
    ./system/udiskie
    ./system/wlogout
    ./system/wlsunset
    ./system/hyprland
  ];

  # ----------------------------------------------------
  # HM packages
  # ----------------------------------------------------
  home.packages = with pkgs; [
    # DEV
    python3
    python312Packages.black
    inputs.alejandra.defaultPackage.${system}

    # MEDIA
    mpv # Video
    imv # Image
    ventoy-full

    # APPS
    protonvpn-cli_2

    keepassxc

    vesktop
    gparted
    nautilus
    file-roller

    overskride
    pwvucontrol

    inputs.zen-browser.packages.${system}.generic
  ];
}
