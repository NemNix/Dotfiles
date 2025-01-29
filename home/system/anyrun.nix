{ inputs, pkgs, ... }:
{
  imports = [ inputs.anyrun.homeManagerModules.anyrun ];

  programs.anyrun = {
    enable = true;

    config = {
      x.fraction = 0.5;
      y.fraction = 0.0;
      width.fraction = 0.3;

      layer = "overlay";
      closeOnClick = true;
      hidePluginInfo = true;

      plugins = with inputs.anyrun.packages.${pkgs.system}; [ applications ];
    };

    extraCss =
      ''
        #window { background: transparent; }
        #entry {
        border: 2px solid #CAD4F5;
        background: #1E1E2E;
        border-radius: 0px;
        }
      '';
  };
}

