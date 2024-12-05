{ pkgs, hostname, inputs, lib, config, ... }:
{
  imports = if hostname == "laptop" then [ inputs.chaotic.nixosModules.default ] else [ ];

  # services.scx.enable = true;

  boot = {
    tmp.cleanOnBoot = true;
    supportedFilesystems.zfs = lib.mkForce false;

    loader = {
      timeout = lib.mkForce 0;
      efi.canTouchEfiVariables = true;

      systemd-boot = {
        enable = true;
        configurationLimit = 10;
      };
    };

    kernelPackages =
      if hostname == "laptop" then pkgs.linuxPackages_zen #linuxPackages_zen #linuxPackages #linuxPackages_latest #linuxPackages_xanmod_latest
      else if hostname == "server" then pkgs.linuxPackages
      else pkgs.linuxPackages_zen;

    kernelParams = [
      "amd_pstate=active"
      "rcutree.enable_rcu_lazy=1"
    ];

  };
}
