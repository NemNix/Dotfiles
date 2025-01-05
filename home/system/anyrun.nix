{ inputs, pkgs, ... }: {

  imports = [ inputs.anyrun.homeManagerModules.anyrun ];

  programs.anyrun = {
    enable = true;
    config = {
      x = { fraction = 0.5; };
      y = { fraction = 0.0; };
      # width = { fraction = 0.3; };
      layer = "overlay";
      closeOnClick = true;

      # hideIcons = false;
      # ignoreExclusiveZones = false;
      # hidePluginInfo = false;
      # showResultsImmediately = false;
      # maxEntries = null;

      plugins = with inputs.anyrun.packages.${pkgs.system}; [
        applications
        translate
      ];
    };

    extraCss =
      ''
        #window { background: transparent; }
        #entry {
        background: #1E1E2E;
        border-radius: 0px;
        }
      '';
  };
}
