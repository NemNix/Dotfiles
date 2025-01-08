{ pkgs, modulesPath, ... }:

{
  # Base ISO configuration
  imports = [
    (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix")
  ];

  # Network configuration
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

  # Disable documentation to reduce image size
  documentation = {
    enable = false;
    doc.enable = false;
    man.enable = false;
    dev.enable = false;
    info.enable = false;
    nixos.enable = false;
  };

  # Essential packages
  environment.systemPackages = with pkgs; [
    yazi # Terminal file manager
    helix # Modern text editor
  ];

  # ISO image configuration
  isoImage = {
    compressImage = true;
    squashfsCompression = null;
    includeSystemBuildDependencies = false;
  };
}
