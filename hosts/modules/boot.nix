{ pkgs, hostname, inputs, lib, ... }:
{
  imports = if hostname == "laptop" then [ inputs.chaotic.nixosModules.default ] else [ ];

  services.scx = {
    enable = true;
    scheduler = "scx_lavd";
    extraArgs = [ "--powersave" ];
  };

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
      if hostname == "laptop" then pkgs.linuxPackages_cachyos #linuxPackages_zen #linuxPackages #linuxPackages_latest #linuxPackages_xanmod_latest
      else if hostname == "server" then pkgs.linuxPackages
      else pkgs.linuxPackages_zen;

    kernelParams = [
      "nowatchdog"
      "nr_running=1"
      "nmi_watchdog=0"
      "amd_pstate=active"
      "usbcore.autosuspend=5"
      "rcutree.enable_rcu_lazy=1"
      "pcie_aspm.policy=powersupersave"
    ];

    kernel.sysctl = {
      "vm.laptop_mode" = 5;
      "vm.vfs_cache_pressure" = 50;
      "vm.dirty_bytes" = 268435456;
      "vm.dirty_writeback_centisecs" = 6000;
      "vm.dirty_background_bytes" = 67108864;

      "sched_mc_power_savings" = 1;
      "devices.system.cpu.sched_mc_power_savings" = 1;

      "module.pcie_aspm.parameters.policy" = "powersave";
      "module.snd_ac97_codec.parameters.power_save" = "Y";
    };

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
  };
}
      
