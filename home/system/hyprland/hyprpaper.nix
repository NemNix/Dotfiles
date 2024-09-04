{
  config,
  pkgs,
  ...
}: {
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "off";
      splash = false;
      preload = ["~/dotfiles/wallpapers/nixos.png"];
      wallpaper = [",~/dotfiles/wallpapers/nixos.png"];
    };
  };
}
