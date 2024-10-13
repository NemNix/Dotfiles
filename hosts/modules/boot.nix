{
  pkgs,
  hostname,
  inputs,
  ...
}:
{
  imports = if hostname == "laptop" then [ inputs.chaotic.nixosModules.default ] else [ ];
  boot = {
    loader = {
      timeout = 3;
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        consoleMode = "max";
        configurationLimit = 10;
      };
    };
    tmp.cleanOnBoot = true;
    kernelPackages =
      if hostname == "laptop" then
        pkgs.linuxPackages_cachyos-rc # pkgs.linuxPackages_zen #linuxPackages #linuxPackages_latest #linuxPackages_xanmod_latest
      else if hostname == "server" then
        pkgs.linuxPackages
      else
        pkgs.linuxPackages_zen;
  };
}
