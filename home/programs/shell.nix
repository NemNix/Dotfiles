{
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
      extraConfig = ''

        # =========================================================================================
        # Settings
        # =========================================================================================
        set -s default-terminal 'tmux-256color'
        bind r source-file ~/.config/tmux/tmux.conf

        set-window-option -g automatic-rename on
        set-option -g set-titles on

        unbind C-b
        set -g prefix C-s
       
        # =========================================================================================
        # Bar 
        # =========================================================================================
        set -g status off

        # =========================================================================================
        # Panes
        # =========================================================================================
        bind -n M-h select-pane -L
        bind -n M-l select-pane -R
        bind -n M-k select-pane -U
        bind -n M-j select-pane -D

        unbind %
        unbind '"'
        bind _ split-window -v -c "#{pane_current_path}"
        bind - split-window -h -c "#{pane_current_path}"

      '';
    };

    fish = {
      enable = false;
      interactiveShellInit = ''set fish_greeting # Disable greeting direnv hook fish | source'';
      shellAliases = {
        cat = "bat";
        ls = "eza";
        la = "eza -a";
        ll = "eza -l";
        lr = "eza -R";
        ".." = "cd ..";
        grep = "grep --color=auto";

        # System
        fetch = "fastfetch";
        startupctl = "systemctl list-unit-files --type=service | grep enabled";

        # NixOS
        rebuild = "clear && nh os switch";
        update = "clear && nh os switch --update";
        garbage = "clear && nh clean all && sudo bootctl cleanup ";

        # Dev
        hxd = "hx ~/Dotfiles/";
        hxc = "hx ~/Code/";
        lg = "lazygit";
        g = "git";

        p = " clear && echo -e '\e[1;34m================= Main.py =====================\e[0m' && python main.py && echo -e '\e[1;34m===============================================\e[0m' ";
      };
    };

    bash = {
      enable = true;
      # enableVteIntegration = true;
      historyIgnore = [ "ls" "cd" "z" "zoxide" "yazi" "rebuild" "update" "garbage" "hx" "btop" "cat" "nh" "mkdir" ];

      shellAliases = {
        cat = "bat";
        ls = "eza";
        la = "eza -a";
        ll = "eza -l";
        lr = "eza -R";
        ".." = "cd ..";
        grep = "grep --color=auto";

        # System
        fetch = "fastfetch";
        startupctl = "systemctl list-unit-files --type=service | grep enabled";

        # NixOS
        rebuild = "clear && nh os switch";
        update = "clear && nh os switch --update";
        garbage = "clear && nh clean all && sudo bootctl cleanup ";

        # Dev
        hxd = "hx ~/Dotfiles/";
        hxc = "hx ~/Code/";
        lg = "lazygit";
        g = "git";

        p = " clear && echo -e '================= Main.py =====================' && python main.py && echo -e '===============================================' ";
      };
    };
  };
}

