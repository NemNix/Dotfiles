{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    historyIgnore = ["ls" "cd" "zoxide" "rebuild" "exit" "poweroff" "bluetoothctl" "btop" "reboot" "garbage" "cat" "z" "fetch" "eza"];
    shellAliases = {
      fetch = "fastfetch";
      rebuild = "nh os switch";
      update = "sudo nix flake update ~/Dotfiles";
      garbage = "nh clean all";

      ls = "eza";
      la = "eza -a";
      ll = "eza -l";
      lr = "eza -R";

      home = "cd ~";
      dot = "cd ~/Dotfiles";
      ".." = "cd ..";

      grep = "grep --color=auto";

      startupctl = "systemctl list-unit-files --type=service | grep enabled";
      qlog = "cat ~/.local/share/qtile/qtile.log";
    };
  };
}
