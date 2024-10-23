{
  programs = {
    zoxide.enable = true;

    eza = {
      enable = true;
      extraOptions = [
        "--group-directories-first"
        "--header"
        "--icons"
      ];
      icons = "auto";
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
        update = "sudo nix flake update ~/Dotfiles";
        garbage = "nh clean all && sudo bootctl cleanup ";

        hxd = "hx ~/Dotfiles/";
        hxc = "hx ~/code/";

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
