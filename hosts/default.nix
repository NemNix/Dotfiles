{ hostname, ... }:
{
  imports =
    if hostname == "laptop" then
      [
        ./laptop.nix

        ./modules/nh.nix
        ./modules/vm.nix
        ./modules/adb.nix
        ./modules/tlp.nix
        ./modules/nix.nix

        ./modules/zsh.nix
        ./modules/bash.nix

        ./modules/boot.nix
        ./modules/time.nix
        ./modules/users.nix
        # ./modules/qtile.nix
        # ./modules/greetd.nix
        # ./modules/polkit.nix
        ./modules/fstrim.nix
        # ./modules/ollama.nix
        # ./modules/xserver.nix
        ./modules/network.nix
        ./modules/pipewire.nix
        ./modules/gsettings.nix
        ./modules/bluetooth.nix
        ./modules/configuration.nix
      ]
    else if hostname == "server" then
      [
        ./server.nix

        ./modules/nh.nix
        ./modules/tlp.nix
        ./modules/ssh.nix
        ./modules/boot.nix
        ./modules/time.nix
        ./modules/users.nix
        ./modules/nvidia.nix
        ./modules/ollama.nix
        ./modules/fstrim.nix
        ./modules/network.nix
        ./modules/configuration.nix
      ]
    else [ ];
}
