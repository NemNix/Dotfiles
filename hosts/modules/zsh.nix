{ pkgs, username, ... }:
{
  users.users.${username}.shell = pkgs.zsh;

  programs.zsh = {

    loginShellInit = '' [ "$(tty)" = "/dev/tty1" ] && exec dbus-run-session sway '';

    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

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
      nrs = "clear && nh os switch";
      nfu = "clear && nh os switch --update";
      ncg = "clear && nh clean all && sudo bootctl cleanup ";

      update = "clear && nix flake update ~/Dotfiles";
      rebuild = "clear && sudo nixos-rebuild switch --flake ~/Dotfiles#laptop";
      garbage = "clear && sudo nix-collect-garbage -d && nix-store --gc ";

      # Dev
      ns = "nix-shell --command zsh -p";
      hxd = "hx ~/Dotfiles/";
      lg = "lazygit";
      g = "git";

      p = '' clear && echo -e "\e[1;34m================= Main.py =====================\e[0m" && python main.py && echo -e "\e[1;34m===============================================\e[0m" '';
    };
  };
}
