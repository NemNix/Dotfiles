{hostname, ...}: {
  networking = {
    hostName = "${hostname}";
    firewall.enable = true;
    networkmanager.enable = true;
  };
  systemd.services.NetworkManager-wait-online.enable = false;
  boot.initrd.systemd.network.wait-online.enable = false;
}
