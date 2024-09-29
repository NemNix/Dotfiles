{config, ...}: {
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        grace = 5;
        no_fade_in = true;
        no_fade_out = true;
        disable_loading_bar = false;
      };

      background = {
        monitor = "";
        path = "~/Dotfiles/home/wallpapers/lock.jpg";
      };

      input-field = [
        {
          monitor = "";
          size = "200 , 50";
          outline_thickness = 7;

          dots_size = 0.2;
          dots_spacing = 0.2;
          dots_center = true;

          fade_on_empty = true;
          fade_timeout = "1000";

          position = "0, -20";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
