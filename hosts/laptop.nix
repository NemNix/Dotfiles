{
  config,
  lib,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    initrd = {
      availableKernelModules = [
        "nvme"
        "xhci_pci"
        "thunderbolt"
        "usb_storage"
        "sd_mod"
        "sdhci_pci"
      ];
      kernelModules = [];
    };

    kernelModules = [
      "kvm-amd"
      "zenpower"
    ];
    kernelParams = ["amd_pstate=active"];
    extraModulePackages = [config.boot.kernelPackages.zenpower];
    blacklistedKernelModules = ["k10temp"];
  };

  hardware = {
    cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/c4bf5427-c442-4d72-89de-1e76cbfd2231";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/413B-C392";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };
  };

  swapDevices = [];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp2s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
