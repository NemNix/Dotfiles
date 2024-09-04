{
  inputs,
  config,
  pkgs,
  ...
}: {
  imports = [inputs.stylix.nixosModules.stylix];

  # Enable Stylix
  stylix.enable = true;

  # Theme
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
  stylix.image = /home/nel/dotfiles/wallpapers/nixppuccin.png;
  stylix.opacity.applications = 0.5;
  stylix.opacity.desktop = 0.5;
  stylix.opacity.terminal = 0.5;

  # Cursor
  stylix.cursor.package = pkgs.bibata-cursors;
  stylix.cursor.name = "Bibata-Modern-Ice";
  stylix.cursor.size = 24;

  # Font
  stylix.fonts = {
    monospace = {
      package = pkgs.nerdfonts;
      name = "LiberationMon";
    };
  };

  stylix.targets.chromium.enable = false;
  stylix.targets.fish.enable = false;
}
