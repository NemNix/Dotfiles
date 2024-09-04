{pkgs, ...}: {
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        ignore_dbus_inhibit = false;
        lock_cmd = "hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = [
        {
          timeout = 600;
          on-timeout = "hyprlock";
        }

        {
          timeout = 660;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
