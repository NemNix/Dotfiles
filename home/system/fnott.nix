{ pkgs, ... }:
{
  home.packages = [ pkgs.fyi ];

  services.fnott = {
    enable = true;
    settings = {

      main = {
        border-size = 3;
        min-width = 100;
        max-width = 600;
        max-height = 400;

        timeout = 3;
        anchor = "top-right";
        edge-margin-vertical = 0;

        title-format = "<b>%a%A\\n<b>";
        summary-format = "%";
      };
    };
  };
}
