{ pkgs, modulesPath, lib, ... }:
{
  # Base ISO configuration
  imports = [ (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix") ];

  users = {
    users.nixos.initialHashedPassword = lib.mkForce "nixos";
  };

  # Network configuration
  networking = {
    hostName = "ISO";
    wireless.enable = false;
    networkmanager.enable = true;
  };

  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      UseDns = true;
      PasswordAuthentication = true;
    };
  };

  # Essential packages
  environment.systemPackages = with pkgs; [
    git
    yazi # Terminal file manager
    helix # Modern text editor
  ];

  # Disable documentation to reduce image size
  documentation = {
    enable = false;
    doc.enable = false;
    man.enable = false;
    dev.enable = false;
    info.enable = false;
    nixos.enable = false;
  };

  # ISO image configuration
  # See: https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/installer/cd-dvd/iso-image.nix
  isoImage = {
    compressImage = false;
    includeSystemBuildDependencies = false;
    squashfsCompression = "zstd -Xcompression-level 19";
  };
}
