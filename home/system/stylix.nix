{ inputs, pkgs, ... }:
{
  imports = [ inputs.stylix.homeManagerModules.stylix ];

  stylix = {
    enable = true;
    autoEnable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

    targets = {
      qt.enable = false;
      yazi.enable = false;
      sway.enable = false;
      tmux.enable = false;
      fish.enable = false;
      wofi.enable = false;
      tofi.enable = false;
      helix.enable = false;
      vscode.enable = false;
      waybar.enable = false;
      hyprland.enable = false;
    };

    iconTheme = {
      enable = true;
      dark = "Papirus-Dark";
      light = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    cursor = {
      size = 24;
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
    };

    fonts = {
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "noto-fonts-color-emoji";
      };

      monospace = {
        package = pkgs.nerd-fonts.droid-sans-mono;
        name = "DroidSansM Nerd Font";
      };

      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };

      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };

      sizes = {
        applications = 12;
        terminal = 12;
        desktop = 10;
        popups = 10;
      };
    };
  };
}
