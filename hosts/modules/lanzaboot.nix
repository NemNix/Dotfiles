{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: {
  import = [inputs.lanzaboote.nixosModules.lanzaboote];
  environment.systemPackages = [
    # For debugging and troubleshooting Secure Boot.
    pkgs.sbctl
  ];
  boot = {
    loader.systemd-boot.enable = lib.mkForce false;

    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };
  };
}
