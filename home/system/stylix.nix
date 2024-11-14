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
      wofi.enable = false;
      tofi.enable = false;
      vscode.enable = false;
      waybar.enable = false;
      hyprland.enable = false;
    };

    image = ../wallpapers/nixppuccin.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

    # override = {
    #   base00 = "1e1e2e"; # base
    #   base01 = "181825"; # mantle
    #   base02 = "313244"; # surface0
    #   base03 = "45475a"; # surface1
    #   base04 = "585b70"; # surface2
    #   base05 = "cdd6f4"; # text
    #   base06 = "f5e0dc"; # rosewater
    #   base07 = "b4befe"; # lavender
    #   base08 = "f38ba8"; # red
    #   base09 = "fab387"; # peach
    #   base0A = "f9e2af"; # yellow
    #   base0B = "a6e3a1"; # green
    #   base0C = "94e2d5"; # teal
    #   base0D = "89b4fa"; # blue
    #   base0E = "cba6f7"; # mauve
    #   base0F = "f2cdcd"; # flamingo
    # };

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
        package = pkgs.nerdfonts;
        name = "DroidSansM Nerd Font Mono";
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
