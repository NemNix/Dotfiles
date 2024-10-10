{username, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../modules/nvidia.nix
    ../modules/boot.nix
    ../modules/lanzaboot.nix
    ../modules/network.nix
    ../modules/ollama.nix
    ../modules/nh.nix
    ../modules/ssh.nix
    ../modules/laptop.nix
    ../modules/users.nix
    ../modules/fstrim.nix
    ../modules/system.nix
  ];

  services.logind = {
    lidSwitch = "ignore";
    lidSwitchExternalPower = "ignore";
  };
}
