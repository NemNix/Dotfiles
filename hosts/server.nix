{ config, lib, modulesPath, pkgs, ... }:
{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  # ==========================================================================================
  # Kernel
  # ==========================================================================================

  boot = {

    initrd.availableKernelModules = [ "xhci_pci" "usbhid" "usb_storage" "sd_mod" "ahci" ];

    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = [ "kvm-intel" ];
  };

  # ==========================================================================================
  # Disks
  # ==========================================================================================

  fileSystems = {
    "/" =
      {
        fsType = "ext4";
        device = "/dev/disk/by-label/NIXROOT";
      };

    "/boot" =
      {
        fsType = "vfat";
        device = "/dev/disk/by-label/NIXBOOT";
        options = [ "fmask=0077" "dmask=0077" ];
      };
  };

  # ==========================================================================================
  # Hardware
  # ===========================================================================================

  hardware = {
    enableAllFirmware = true;
    cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}
