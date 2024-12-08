{
  programs = {
    zsh.enable = true;
    bash.enable = true;

    bat.enable = true;
    fzf.enable = true;
    zoxide.enable = true;

    eza = {
      enable = true;
      extraOptions =
        [
          "--group-directories-first"
          "--header"
          "--icons"
        ];
    };

    starship = {
      enable = true;
      settings = {

        format = "$directory$character";
        right_format = "$all";

        add_newline = true;
        command_timeout = 1000;
        line_break.disabled = true;
      };
    };
  };
}



