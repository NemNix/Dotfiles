{
  inputs,
  nixpkgs,
  self,
  username,
  host,
  ...
}: {
  imports =
    [(import ./boot.nix)]
    ++ [(import ./greetd.nix)]
    ++ [(import ./adb.nix)]
    ++ [(import ./nvidia.nix)]
    ++ [(import ./stylix.nix)]
    ++ [(import ./xserver.nix)]
    #++ [ (import ./kde.nix) ]
    ++ [(import ./pipewire.nix)]
    ++ [(import ./system.nix)]
    ++ [(import ./ananicy.nix)]
    ++ [(import ./fstrim.nix)]
    ++ [(import ./network.nix)]
    #++ [ (import ./qtile.nix) ]
    ++ [(import ./laptop.nix)]
    ++ [(import ./bluetooth.nix)]
    ++ [(import ./gaming.nix)]
    ++ [(import ./nh.nix)]
    ++ [(import ./security.nix)]
    ++ [(import ./users.nix)]
    ++ [(import ./thunar.nix)];
}
