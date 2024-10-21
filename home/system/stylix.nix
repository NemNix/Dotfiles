{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.stylix.homeManagerModules.stylix];

  gtk.iconTheme.package = pkgs.papirus-icon-theme;
  gtk.iconTheme.name = "Papirus-Dark";

  stylix = {
    enable = true;
    autoEnable = true;
    targets.foot.enable = false;
    targets.wofi.enable = false;
    targets.vscode.enable = false;
    targets.waybar.enable = false;
    targets.hyprland.enable = false;

    image = /home/nel/Dotfiles/home/wallpapers/nixppuccin.png;
    base16Scheme = {
      base00 = "1e1e2e"; # base
      base01 = "181825"; # mantle
      base02 = "313244"; # surface0
      base03 = "45475a"; # surface1
      base04 = "585b70"; # surface2
      base05 = "cdd6f4"; # text
      base06 = "f5e0dc"; # rosewater
      base07 = "b4befe"; # lavender
      base08 = "f38ba8"; # red
      base09 = "fab387"; # peach
      base0A = "f9e2af"; # yellow
      base0B = "a6e3a1"; # green
      base0C = "94e2d5"; # teal
      base0D = "89b4fa"; # blue
      base0E = "cba6f7"; # mauve
      base0F = "f2cdcd"; # flamingo
    };

    cursor.size = 24;
    cursor.name = "Bibata-Modern-Ice";
    cursor.package = pkgs.bibata-cursors;

    fonts = {
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "noto-fonts-color-emoji";
      };

      monospace = {
        package = pkgs.nerdfonts.override {fonts = ["DroidSansMono"];};
        name = "DroidSansMono";
      };

      sansSerif = {
        package = pkgs.nerdfonts.override {fonts = ["DroidSansMono"];};
        name = "DroidSansMono";
      };

      serif = {
        package = pkgs.nerdfonts.override {fonts = ["DroidSansMono"];};
        name = "DroidSansMono";
      };
    };
  };
}
