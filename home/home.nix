{ hostname, ... }:
{
  imports =
    if hostname == "laptop" then
      [
        ./programs/git.nix
        ./programs/btop.nix
        ./programs/yazi.nix
        ./programs/foot.nix
        ./programs/shell.nix
        ./programs/helix.nix
        ./programs/zathura.nix
        ./programs/packages.nix
        ./programs/freetube.nix
        ./programs/vscodium.nix
        # ./programs/spicetify.nix
        ./programs/fastfetch.nix
        # ./programs/firefox.nix

        ./system/wofi.nix
        ./system/dunst.nix
        ./system/stylix.nix
        ./system/waybar.nix
        ./system/anyrun.nix
        ./system/wlsunset.nix
        # ./system/hyprland.nix

        ./system/sway.nix
      ]
    else if hostname == "server" then
      [
        ./programs/git.nix
        ./programs/btop.nix
        ./programs/yazi.nix
        ./programs/shell.nix
        ./programs/helix.nix
        ./programs/fastfetch.nix
      ]
    else [ ];
}
