{
  programs = {
    mcfly.enable = true;
    zoxide.enable = true;

    eza = {
      enable = true;
      icons = "auto";
      extraOptions = [
        "--group-directories-first"
        "--header"
        "--icons"
      ];
    };

    starship = {
      enable = true;
      settings = {
        add_newline = true;
      };
    };

    zellij = {
      enable = true;
      settings = {
        ui = {
          pane_frames.hide_session_name = true;
          pane_borderless = true;
        };
      };
    };

    bash = {
      enable = true;
      enableCompletion = true;
      shellAliases = {
        fetch = "fastfetch";
        rebuild = "nh os switch";
        update = "nh os switch --update";
        garbage = "nh clean all && sudo bootctl cleanup ";

        hxd = "hx ~/Dotfiles/";
        hxc = "hx ~/code/";
        g = "git";

        ls = "eza";
        la = "eza -a";
        ll = "eza -l";
        lr = "eza -R";
        tree = "eza -T";

        ".." = "cd ..";

        grep = "grep --color=auto";

        startupctl = "systemctl list-unit-files --type=service | grep enabled";
      };
    };
  };
}
