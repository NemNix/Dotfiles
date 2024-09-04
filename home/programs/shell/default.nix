{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      fetch = "fastfetch";
      rebuild = "nh os switch";
      update = "nh os switch --update";
      garbage = "nh clean all";

      ls = "ls --color=auto";
      la = "ls -a";
      ll = "ls -l";

      nel = "cd /home/nel";
      ".." = "cd ..";

      grep = "grep --color=auto";

      startupctl = "systemctl list-unit-files --type=service | grep enabled";
      qlog = "cat ~/.local/share/qtile/qtile.log";
    };
  };
}
