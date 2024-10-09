{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./programs/git.nix
    ./programs/btop.nix
    ./programs/yazi.nix
    ./programs/foot.nix
    ./programs/bash.nix
    ./programs/helix.nix
    ./programs/kitty.nix
    ./programs/zellij.nix
    ./programs/zoxide.nix
    ./programs/packages.nix
    ./programs/starship.nix
    ./programs/freetube.nix
    ./programs/vscodium.nix
    ./programs/spicetify.nix
    ./programs/fastfetch.nix

    ./tofi.nix
    ./system/wofi.nix
    ./system/dunst.nix
    ./system/stylix.nix
    ./system/waybar.nix
    ./system/udiskie.nix
    ./system/wlogout.nix
    ./system/wlsunset.nix
    ./system/hyprland.nix
  ];
}
