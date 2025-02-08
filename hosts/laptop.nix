{ config, lib, modulesPath, pkgs, inputs, ... }:
{
  imports = [
    inputs.chaotic.nixosModules.default
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  # ==========================================================================================
  # Kernel
  # ============================================= =============================================

  boot = {

    initrd.availableKernelModules = [ "nvme" "xhci_pci" "thunderbolt" "usbhid" "usb_storage" "sd_mod" ];

    kernelPackages = pkgs.linuxPackages_cachyos;
    kernelModules = [ "kvm-amd" ];

    kernelParams = [
      "nowatchdog"
      "nr_running=1"
      "nmi_watchdog=0"
      "amd_pstate=active"
      "usbcore.autosuspend=5"
      "rcutree.enable_rcu_lazy=1"
      "pcie_aspm.policy=powersupersave"
    ];

    blacklistedKernelModules = [
      "sp5100_tco"
      "asus_wmi"
      "intel_rapl_msr"
      "intel_rapl_common"
      "snd_intel_dspcfg"
      "snd_intel_sdw_acpi"
      "ghash_clmulni_intel"
      "aesni_intel"
      "crypto_simd"
      "crc32c_intel"
    ];

    kernel.sysctl = {
      "vm.laptop_mode" = 5;
      "vm.vfs_cache_pressure" = 50;
      "vm.dirty_bytes" = 268435456;
      "vm.dirty_writeback_centisecs" = 1500;
      "vm.dirty_background_bytes" = 67108864;

      "sched_mc_power_savings" = 1;
      "devices.system.cpu.sched_mc_power_savings" = 1;

      "module.pcie_aspm.parameters.policy" = "powersave";
      "module.snd_ac97_codec.parameters.power_save" = "Y";
    };
  };

  services.scx = {
    enable = true;
    scheduler = "scx_lavd";
    extraArgs = [ "--autopower" ];
  };

  # ==========================================================================================
  # Disks
  # ===========================================================================================

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
    cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}
