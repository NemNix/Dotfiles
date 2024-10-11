{
  config,
  pkgs,
  system,
  hostname,
  ...
}: {
  boot = {
    kernelModules = ["acpi_call"];
    extraModulePackages = with config.boot.kernelPackages; [acpi_call];
  };
  environment.systemPackages = [pkgs.powertop];
  powerManagement.powertop.enable = true;

  services = {
    logind.lidSwitchExternalPower = "ignore";

    auto-cpufreq.enable =
      if hostname == "laptop"
      then true
      else false;

    system76-scheduler.enable =
      if hostname == "laptop"
      then false
      else false;

    tlp = {
      enable = false;
      settings = {
        TLP_DEFAULT_MODE =
          if hostname == "laptop"
          then "BAT"
          else "AC";
        TLP_PERSISTENT_DEFAULT =
          if hostname == "laptop"
          then 0
          else 1;

        CPU_DRIVER_OPMODE_ON_AC = "active";
        CPU_DRIVER_OPMODE_ON_BAT = "active";
        CPU_BOOST_ON_AC = 1;
        CPU_BOOST_ON_BAT = 0;
        CPU_HWP_DYN_BOOST_ON_AC = 1;
        CPU_HWP_DYN_BOOST_ON_BAT = 0;
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";

        RADEON_DPM_PERF_LEVEL_ON_AC = "auto";
        RADEON_DPM_PERF_LEVEL_ON_BAT = "low";
        RADEON_DPM_STATE_ON_AC = "performance";
        RADEON_DPM_STATE_ON_BAT = "battery";
        RADEON_POWER_PROFILE_ON_AC = "default";
        RADEON_POWER_PROFILE_ON_BAT = "low";

        PLATFORM_PROFILE_ON_AC = "performance";
        PLATFORM_PROFILE_ON_BAT = "low-power";

        START_CHARGE_THRESH_BAT0 = 40;
        STOP_CHARGE_THRESH_BAT0 = 60;

        WIFI_PWR_ON_AC = "off";
        WIFI_PWR_ON_BAT = "on";

        WOL_DISABLE = "Y";

        RESTORE_DEVICE_STATE_ON_STARTUP = 1;
        DEVICES_TO_DISABLE_ON_BAT_NOT_IN_USE = "bluetooth";

        RUNTIME_PM_ON_AC = "on";
        RUNTIME_PM_ON_BAT = "auto";

        USB_AUTOSUSPEND = 1;
      };
    };
  };
}
