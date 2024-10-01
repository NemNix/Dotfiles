{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [libnotify];

  services.dunst = {
    enable = true;
    package = pkgs.dunst;

    settings = {
      global = {
        follow = "mouse";

        width = "0 , 600";
        height = "400";

        origin = "top-center";
        offset = "0x10";

        corner_radius = "10";
      };

      fullscreen_delay_everything = {fullscreen = "delay";};
    };
  };
}
