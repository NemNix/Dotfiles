{
  programs.git = {
    enable = true;
    userEmail = "pynel@prout.com";
    userName = "Pynel";
    extraConfig = {
      pull.rebase = "false";
      init = {
        defaultBranch = "main";
      };
    };
  };
}
