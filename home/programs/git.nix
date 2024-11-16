{
  programs = {
    lazygit.enable = true;
    git = {
      enable = true;

      userName = "NemNix";
      userEmail = "184756415+NemNix@users.noreply.github.com";

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
  };
}
