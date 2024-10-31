{ username, ... }:
{
  programs.nh = {
    enable = true;
    flake = "/home/${username}/Dotfiles";
    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = "--keep-since 3d --keep 3";
    };
  };
}
