{
  networking.firewall.allowedTCPPorts = [ 22 ];

  services.openssh = {
    enable = true;
    ports = [ 22 ];

    settings = {
      UseDns = true;
      PasswordAuthentication = true;
    };
  };
}
