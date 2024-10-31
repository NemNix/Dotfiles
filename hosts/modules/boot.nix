{ pkgs, hostname, inputs, ... }:
{
  imports = if hostname == "laptop" then [ inputs.chaotic.nixosModules.default ] else [ ];

  boot = {
    tmp.cleanOnBoot = true;

    loader = {
      timeout = 3;
      efi.canTouchEfiVariables = true;

      systemd-boot = {
        enable = true;
        configurationLimit = 10;
      };
    };

    kernelPackages =
      if hostname == "laptop" then pkgs.linuxPackages_cachyos #linuxPackages_zen #linuxPackages #linuxPackages_latest #linuxPackages_xanmod_latest
      else if hostname == "server" then pkgs.linuxPackages
      else pkgs.linuxPackages_zen;
  };
}
