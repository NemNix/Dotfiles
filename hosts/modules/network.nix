{ hostname, ... }:
{
  boot.initrd.systemd.network.wait-online.enable = false;
  systemd.services.NetworkManager-wait-online.enable = false;

  networking = {
    hostName = "${hostname}";
    firewall.enable = true;
    networkmanager.enable = true;
  };
}
