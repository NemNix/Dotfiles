{username, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../modules/nvidia.nix
    ../modules/boot.nix
    ../modules/network.nix
    ../modules/fstrim.nix
    ../modules/system.nix
  ];

  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = ["networkmanager" "wheel"];
  };
}
