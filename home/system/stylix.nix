{ inputs, pkgs, ... }:
{
  imports = [ inputs.stylix.homeManagerModules.stylix ];

  qt = {
    enable = false;
    style.name = "gtk2";
    platformTheme.name = "gtk";
  };

  gtk.iconTheme = {
    name = "Papirus-Dark";
    package = pkgs.papirus-icon-theme;
  };

  stylix = {
    enable = true;
    autoEnable = true;

    targets = {
      sway.enable = false;
      tmux.enable = false;
      fish.enable = false;
      wofi.enable = false;
      tofi.enable = false;
      vscode.enable = false;
      waybar.enable = false;
      hyprland.enable = false;
    };

    image = ../wallpapers/nixos-mocha.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

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
