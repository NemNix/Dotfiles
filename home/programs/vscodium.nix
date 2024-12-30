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

      "editor.fontSize" = 16;
      "explorer.confirmDelete" = false;
      "explorer.confirmDragAndDrop" = true;
      "git.openRepositoryInParentFolders" = "never";

      "[python]" = {
        "editor.defaultFormatter" = "ms-python.black-formatter";
        "editor.formatOnSave" = true;
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
                "expr" = "(builtins.getFlake \"/home/nel/Dotfiles\").nixosConfigurations.laptop.options";
              };
            };
          };
        };
      };

      "editor.formatOnSave" = true;

      "editor.fontLigatures" = true;
      "editor.formatOnPaste" = true;
      "editor.minimap.enabled" = false;

      "symbols.hidesExplorerArrows" = false;

      "catppuccin.accentColor" = "blue";
      "workbench.iconTheme" = "vs-minimal";
      "workbench.colorTheme" = "Catppuccin Mocha";
      "workbench.preferredDarkColorTheme" = "Catppuccin Mocha";
      "workbench.preferredHighContrastColorTheme" = "Catppuccin Mocha";

    };
  };
}
