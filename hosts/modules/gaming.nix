{ pkgs, username, ... }:
{
  users.users.${username}.packages = with pkgs; [ heroic ];
  hardware.steam-hardware.enable = true;

  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;
      extraCompatPackages = with pkgs; [ proton-ge-bin ];
    };

    gamemode = {
      enable = false;
      enableRenice = false;
      settings = { };
    };

    gamescope = {
      enable = false;
      args = [
        "-w 1920 -h 1080"
        "-F nis"
        "f"
      ];
    };
  };
}
