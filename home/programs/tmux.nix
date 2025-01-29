{
  tmux = {
    enable = false;
    extraConfig = ''

      # =========================================================================================
      # Settings
      # =========================================================================================
      set - s default-terminal 'tmux-256color'
      bind r source-file ~/.config/tmux/tmux.conf

      set-window-option - g automatic-rename on
      set-option - g set-titles on

      unbind
      C-b
      set - g prefix C-s

      # =========================================================================================
      # Bar 
      # =========================================================================================
      set - g status off

      # =========================================================================================
      # Panes
      # =========================================================================================
      bind - n M-h select-pane - L
      bind - n M-l select-pane - R
      bind - n M-k select-pane - U
      bind - n M-j select-pane - D

      unbind %
      unbind '"'
      bind _ split-window -v -c "#{pane_current_path}"
      bind - split-window - h - c "#{pane_current_path}"
      '';
  };
}
