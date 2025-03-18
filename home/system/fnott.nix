{ pkgs, ... }:
{
  home.packages = [ pkgs.fyi ];

  services.fnott = {
    enable = true;
    settings = {

      main = {
        border-size = 4;
        min-width = 100;
        max-width = 600;
        max-height = 400;

        anchor = "center";
        edge-margin-vertical = 0;

        title-format = "<b>%a%A\\n<b>";
        summary-format = "%";
      };
    };
  };
}
