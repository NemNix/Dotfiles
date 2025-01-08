{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    extensions = with pkgs.vscode-extensions; [
      ms-python.python
      ms-python.debugpy
      jnoortheen.nix-ide
      catppuccin.catppuccin-vsc
    ];

    userSettings = {

      # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      # Helix config
      # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      "editor.fontSize" = 16;
      "editor.formatOnSave" = true;
      "editor.fontLigatures" = true;
      "editor.formatOnPaste" = true;
      "editor.minimap.enabled" = false;

      "explorer.confirmDelete" = false;
      "explorer.confirmDragAndDrop" = true;

      "symbols.hidesExplorerArrows" = false;
      "git.openRepositoryInParentFolders" = "never";

      "workbench.editor.autoLockGroups" = false;

      "catppuccin.accentColor" = "mauve";
      "workbench.iconTheme" = "seti";
      "workbench.colorTheme" = "Catppuccin Mocha";
      "workbench.preferredDarkColorTheme" = "Catppuccin Mocha";
      "workbench.preferredHighContrastColorTheme" = "Catppuccin Mocha";

      # --------------------------------
      # languages Configuration 
      # --------------------------------

      "[python]" = {
        "editor.formatOnSave" = true;
        "editor.defaultFormatter" = "ms-python.black-formatter";
      };

      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "${pkgs.nixd}/bin/nixd";
      "nix.serverSettings" = {
        "nixd" = {
          "formatting" = {
            "command" = [ "${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt" ];
          };
          "nixpkgs" = {
            "expr" = "import <nixpkgs> { }";
            "options" = {
              "nixos" = {
                "expr" = "(builtins.getFlake \"/home/nem/Dotfiles\").nixosConfigurations.laptop.options";
              };
            };
          };
        };
      };
    };
  };
}
