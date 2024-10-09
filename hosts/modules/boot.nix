{
  pkgs,
  inputs,
  hostname,
  ...
}: {
  boot = {
    #kernelPackages = pkgs.linuxPackages;
    #kernelPackages = pkgs.linuxPackages_latest;
    #kernelPackages = pkgs.linuxPackages_xanmod_latest;
    kernelPackages =
      if hostname == "laptop"
      then pkgs.linuxPackages_zen
      else if hostname == "server"
      then pkgs.linuxPackages_latest_hardened
      else pkgs.linuxPackages_zen;
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

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
