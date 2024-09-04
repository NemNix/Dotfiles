{pkgs, ...}: {
  boot = {
    loader.efi.canTouchEfiVariables = true;
    loader.systemd-boot = {
      enable = true;
      consoleMode = "auto";
    };
    tmp.cleanOnBoot = true;
    kernelPackages = pkgs.linuxPackages_latest;
    #kernelPackages = pkgs.linuxPackages_zen;
    #kernelPackages = pkgs.linuxPackages_xanmod_latest;
    kernelParams = ["amd_pstate=active"];
  };
}
