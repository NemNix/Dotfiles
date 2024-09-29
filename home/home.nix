{
  inputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./programs/git
    ./programs/btop
    ./programs/yazi
    #./programs/foot
    ./programs/kitty
    ./programs/shell
    ./programs/fetch
    ./programs/vscodium
    #./programs/chromium
    #./programs/vesktop
    ./programs/freetube
    ./programs/spicetify
    #./programs/librewolf

    #./system/ags
    ./system/wofi
    ./system/dunst
    ./system/stylix
    ./system/waybar
    #./system/mime/
    ./system/udiskie
    #./system/wlgout
    ./system/wlsunset
    ./system/hyprland
  ];

  # ----------------------------------------------------
  # HM packages
  # ----------------------------------------------------
  home.packages = with pkgs; [
    inputs.alejandra.defaultPackage.${system}
    inputs.zen-browser.packages.${system}.generic

    python3
    python312Packages.black

    # MEDIA
    mpv # Video
    imv # Image
    ventoy-full
    nautilus
    pwvucontrol # Sound
    overskride
    file-roller

    # APPS
    keepassxc # Password
    protonvpn-cli_2 # VPN
    vesktop
  ];
}
