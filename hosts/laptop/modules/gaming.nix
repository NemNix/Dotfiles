{
  config,
  pkgs,
  ...
}: {
  users.users.nel.packages = with pkgs; [bottles];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    gamescopeSession.enable = true;
    extraCompatPackages = with pkgs; [proton-ge-bin];
  };

  hardware.steam-hardware.enable = true;
  programs.gamescope.enable = true;
}
