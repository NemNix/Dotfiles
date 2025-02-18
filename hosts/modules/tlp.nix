{ hostname, ... }:
{
  # services.system76-scheduler.enable = true;

  services.tlp = {
    enable = true;

    settings = {

      TLP_DEFAULT_MODE =
        if hostname == "laptop"
        then "BAT"
        else "AC";

      TLP_PERSISTENT_DEFAULT =
        if hostname == "laptop"
        then 0
        else 1;

      NATACPI_ENABLE =
        if hostname == "laptop"
        then 0
        else 1;

      TPACPI_ENABLE =
        if hostname == "laptop"
        then 0
        else 1;

      TPSMAPI_ENABLE =
        if hostname == "laptop"
        then 0
        else 1;

      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;
      CPU_HWP_DYN_BOOST_ON_AC = 1;
      CPU_HWP_DYN_BOOST_ON_BAT = 0;

      CPU_DRIVER_OPMODE_ON_AC = "active";
      CPU_DRIVER_OPMODE_ON_BAT = "active";

      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";

      RADEON_DPM_STATE_ON_AC = "performance";
      RADEON_DPM_STATE_ON_BAT = "battery";
      RADEON_POWER_PROFILE_ON_AC = "default";
      RADEON_POWER_PROFILE_ON_BAT = "low";

      AMDGPU_ABM_LEVEL_ON_AC = 0;
      AMDGPU_ABM_LEVEL_ON_BAT = 0;

      PLATFORM_PROFILE_ON_AC = "performance";
      PLATFORM_PROFILE_ON_BAT = "low-power";

      START_CHARGE_THRESH_BAT0 = 40;
      STOP_CHARGE_THRESH_BAT0 = 60;

      NMI_WATCHDOG = 0;
    };
  };
}
