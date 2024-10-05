{
  pkgs,
  inputs,
  ...
}: {
  boot = {
    #kernelPackages = pkgs.linuxPackages;
    kernelPackages = pkgs.linuxPackages_latest;
    #kernelPackages = pkgs.linuxPackages_xanmod_latest;
    #kernelPackages = pkgs.linuxPackages_zen;
    kernelParams = ["amd_pstate=active"];
    tmp.cleanOnBoot = true;

    loader = {
      timeout = 3;
      efi.canTouchEfiVariables = true;

      systemd-boot = {
        enable = true;
        consoleMode = "auto";
      };
    };
  };
}
