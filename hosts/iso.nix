{ pkgs, modulesPath, ... }:
{
  # Base ISO configuration
  imports = [ (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix") ];

  # Network configuration
  boot.initrd.systemd.network.wait-online.enable = false;
  systemd.services.NetworkManager-wait-online.enable = false;

  networking = {
    hostName = "ISO";
    firewall.enable = true;
    firewall.allowedTCPPorts = [ 22 ];

    wireless = {
      enable = false;
      iwd.enable = false;
    };

    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
      wifi = {
        powersave = true;
        backend = "wpa_supplicant";
      };
    };
  };

  services.openssh = {
    enable = true;
    ports = [ 22 ];

    settings = {
      PasswordAuthentication = true;
      UseDns = true;
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
