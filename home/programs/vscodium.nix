{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    extensions = with pkgs.vscode-extensions; [
      catppuccin.catppuccin-vsc
    ];

    userSettings = {

      # ================================================================================================
      # IDE config
      # ================================================================================================

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
      "workbench.colorTheme" = "Catppuccin Mocha";
      "workbench.preferredDarkColorTheme" = "Catppuccin Mocha";
      "workbench.preferredHighContrastColorTheme" = "Catppuccin Mocha";

      # ================================================================================================
      # languages Configuration 
      # ================================================================================================

    };
  };
}
