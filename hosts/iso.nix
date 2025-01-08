{ pkgs, modulesPath, ... }:
{
  imports = [ (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix") ];

  boot.initrd.systemd.network.wait-online.enable = false;
  systemd.services.NetworkManager-wait-online.enable = false;
  networking = {
    hostName = "iso";
    firewall.enable = true;
    wireless = {
      enable = false;
      iwd.enable = false;
    };
    networkmanager = {
      enable = true;
      wifi.backend = "wpa_supplicant";
    };
  };

  documentation = {
    enable = false;
    doc.enable = false;
    man.enable = false;
    dev.enable = false;
    info.enable = false;
    nixos.enable = false;
  };

  environment.systemPackages = with pkgs; [
    yazi
    helix
  ];

  isoImage = {
    compressImage = true;
    squashfsCompression = null;
    includeSystemBuildDependencies = false;
  };
}

