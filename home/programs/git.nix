{
  programs.git = {
    enable = true;

    userName = "PyNEL";
    userEmail = "pynel@noreply.codeberg.org";

    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
    };
  };
}
