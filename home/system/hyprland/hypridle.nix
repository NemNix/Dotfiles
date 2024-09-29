{pkgs, ...}: {
  services.hypridle = {
    enable = true;

    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session ";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = [
        {
          timeout = 60;
          on-timeout = "brightnessctl -sd asus::kbd_backlight set 0";
          on-resume = "brightnessctl -rd asus::kbd_backlight";
        }

        {
          timeout = 120;
          on-timeout = "brightnessctl -s set 0";
          on-resume = "brightnessctl -r";
        }

        {
          timeout = 300;
          on-timeout = "hyprctl dispatch dpms off ";
          on-resume = "hyprctl dispatch dpms on";
        }

        {
          timeout = 300;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
