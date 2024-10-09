{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    extensions = with pkgs.vscode-extensions; [
      ms-python.python
      ms-python.debugpy
      bbenoist.nix
      kamadorueda.alejandra
      catppuccin.catppuccin-vsc
      formulahendry.code-runner
    ];

    userSettings = {
      "workbench.colorTheme" = "Catppuccin Mocha";
      "editor.fontSize" = 16;
      "explorer.confirmDelete" = false;
      "explorer.confirmDragAndDrop" = false;
      "git.openRepositoryInParentFolders" = "never";
      "[python]" = {
        "editor.defaultFormatter" = "ms-python.black-formatter";
        "editor.formatOnSave" = true;
      };
      "editor.formatOnSave" = true;
      "symbols.hidesExplorerArrows" = false;
      "editor.formatOnPaste" = true;
      "editor.minimap.enabled" = false;
      "workbench.preferredDarkColorTheme" = "Catppuccin Mocha";
      "workbench.preferredHighContrastColorTheme" = "Catppuccin Mocha";
      "workbench.iconTheme" = "vs-minimal";
      "catppuccin.accentColor" = "blue";
      "editor.fontLigatures" = true;
    };
  };
}
