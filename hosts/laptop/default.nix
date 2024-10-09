{
  imports = [
    ./hardware-configuration.nix
    # ../modules/vm.nix
    ../modules/nh.nix
    #../modules/adb.nix
    ../modules/boot.nix
    ../modules/lanzaboot.nix
    ../modules/users.nix
    #../modules/thunar.nix
    ../modules/greetd.nix
    #../modules/nvidia.nix
    ../modules/system.nix
    ../modules/fstrim.nix
    ../modules/laptop.nix
    #../modules/gaming.nix
    #../modules/xserver.nix
    #../modules/ananicy.nix
    ../modules/network.nix
    ../modules/security.nix
    ../modules/pipewire.nix
    ../modules/gsettings.nix
    ../modules/bluetooth.nix
  ];
}
