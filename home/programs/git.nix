{
  programs.git = {
    enable = true;

    userName = "NemNix";
    userEmail = "NemNix@noreply.codeberg.org";

    ignores = [
      ".cache/"
      ".DS_Store"
      ".idea/"
      "*.swp"
      "*.elc"
      "auto-save-list"
      ".direnv/"
      "node_modules"
      "result"
      "result-*"
    ];

    aliases = {
      status = "status";
      check = "checkout";

      a = "add .";
      c = "commit -m";
      p = "push";

      add = "remote add";
      remove = "remote remove";
    };

    extraConfig = {
      color.ui = "1";
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
    };
  };
}
