{hostname, ...}: {
  imports =
    if hostname == "laptop"
    then [
      ./laptop.nix

      ./modules/nh.nix
      ./modules/tlp.nix
      ./modules/boot.nix
      ./modules/users.nix
      ./modules/greetd.nix
      ./modules/system.nix
      ./modules/fstrim.nix
      ./modules/network.nix
      ./modules/security.nix
      ./modules/pipewire.nix
      ./modules/gsettings.nix
      ./modules/bluetooth.nix
      ./modules/lanzaboot.nix
    ]
    else if hostname == "server"
    then [
      ./server.nix

      ./modules/nh.nix
      ./modules/tlp.nix
      ./modules/ssh.nix
      ./modules/boot.nix
      ./modules/users.nix
      ./modules/nvidia.nix
      ./modules/ollama.nix
      ./modules/fstrim.nix
      ./modules/system.nix
      ./modules/network.nix
      #./modules/lanzaboot.nix
    ]
    else [];
}
