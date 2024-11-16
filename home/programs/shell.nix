{ pkgs, ... }: {
  programs = {
    bat.enable = true;
    fzf.enable = true;
    zoxide.enable = true;

    eza = {
      enable = true;
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
        command_timeout = 1000;
        line_break.disabled = true;
      };
    };

    tmux = {
      enable = true;
      keyMode = "vi";
      terminal = "screen-256color";
      plugins = with pkgs.tmuxPlugins; [ catppuccin ];

      extraConfig = ''
        set -g @catppuccin_flavor "mocha"
        set -g status-right-length 100
        set -g status-left-length 100
        set -g status-left ""
        set -g status-right "#{E:@catppuccin_status_application}"
        set -ag status-right "#{E:@catppuccin_status_session}"
        set -g prefix C-s
        set-option -g status-position top

        bind-key h select-pane -L
        bind-key j select-pane -D
        bind-key k select-pane -U
        bind-key l select-pane -R
        
        bind '"' split-window -v -c  "#{pane_current_path}"
        bind % split-window -h -c  "#{pane_current_path}"
      '';
    };

    bash = {
      enable = true;
      # enableVteIntegration = true;

      shellAliases = {
        cat = "bat";
        fetch = "fastfetch";

        rebuild = "clear && nh os switch";
        update = "clear && nh os switch --update";
        garbage = "clear && nh clean all && sudo bootctl cleanup ";

        hxd = "hx ~/Dotfiles/";
        hxc = "hx ~/Code/";
        g = "git";

        ls = "eza";
        la = "eza -a";
        ll = "eza -l";
        lr = "eza -R";
        tree = "eza -T";

        ".." = "cd ..";

        grep = "grep --color=auto";

        startupctl = "systemctl list-unit-files --type=service | grep enabled";


        # Dev
        p = "clear && python main.py";
      };

      historyIgnore = [
        "ls"
        "cd"
        "z"
        "zoxide"
        "yazi"
        "rebuild"
        "update"
        "garbage"
        "hx"
        "btop"
        "cat"
        "nh"
        "mkdir"
      ];
    };
  };
}

