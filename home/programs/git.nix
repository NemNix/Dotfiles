{
  programs.git = {
    enable = true;

    userName = "NemNix";
    userEmail = "NemNix@noreply.codeberg.org";

    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
    };
  };
}
