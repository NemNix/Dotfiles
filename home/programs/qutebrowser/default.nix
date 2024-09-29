{
  pkgs,
  config,
  ...
}: {
  programs.qutebrowser = {
    enable = true;

    searchEngines = {
      "DEFAULT" = "https://duckduckgo.com/?q={}&ia=web";
      "d" = "https://duckduckgo.com/?q={}&ia=web";
      "g" = "https://google.com/search?q={}";
      "n" = "https://mynixos.com/search?q={}";
      "nixo" = "https://search.nixos.org/options?channel=unstable&query={}";
      "nixp" = "https://search.nixos.org/packages?channel=unstable&query={}";
      "gt" = "https://github.com/search?q={}&type=repositories";
    };

    quickmarks = {
      YB = "https://idp.unibocconi.it/idp/profile/SAML2/Redirect/SSO?execution=e1s1";
      outlook = "https://outlook.office.com/mail/";
      proton = "https://mail.proton.me/u/0/inbox";
      drive = "https://drive.proton.me/u/0/";
      codeberg = "https://codeberg.org/";
      mistral = "https://chat.mistral.ai/chat";
      mynixos = "https://mynixos.com";
      github = "https://github.com";
      nixvim = "https://nix-community.github.io/nixvim/";
      hyprland = "https://wiki.hyprland.org/";
      nerdfont = "https://www.nerdfonts.com/cheat-sheet";
    };

    settings = {
      url = {
        default_page = "https://duckduckgo.com/";
        start_pages = ["https://duckduckgo.com/"];
      };
    };

    keyBindings = {
      normal = {
        " p" = "tab-move -";
        " n" = "tab-move +";
        " w" = "tab-close";
        " 1" = "tab-focus 1";
        " 2" = "tab-focus 2";
        " 3" = "tab-focus 3";
        " 4" = "tab-focus 4";
        " 5" = "tab-focus 5";
        " 6" = "tab-focus 6";
        " 7" = "tab-focus 7";
        " 8" = "tab-focus 8";
        " 9" = "tab-focus 9";
        " 0" = "tab-focus 10";
        "<Ctrl-w>" = "tab-close";
        "<Ctrl-n>" = "open -w";
        "<Ctrl-1>" = "tab-focus 1";
        "<Ctrl-2>" = "tab-focus 2";
        "<Ctrl-3>" = "tab-focus 3";
        "<Ctrl-4>" = "tab-focus 4";
        "<Ctrl-5>" = "tab-focus 5";
        "<Ctrl-6>" = "tab-focus 6";
        "<Ctrl-7>" = "tab-focus 7";
        "<Ctrl-8>" = "tab-focus 8";
        "<Ctrl-9>" = "tab-focus 9";
        "<Ctrl-0>" = "tab-focus 10";
      };

      command = {
        "<Ctrl-w>" = "tab-close";
        "<Ctrl-n>" = "open -w";
        "<Ctrl-ampersand>" = "tab-focus 1";
        "<Ctrl-eacute>" = "tab-focus 2";
        "<Ctrl-quotedbl>" = "tab-focus 3";
        "<Ctrl-4>" = "tab-focus 4";
        "<Ctrl-5>" = "tab-focus 5";
        "<Ctrl-6>" = "tab-focus 6";
        "<Ctrl-7>" = "tab-focus 7";
        "<Ctrl-8>" = "tab-focus 8";
        "<Ctrl-9>" = "tab-focus 9";
        "<Ctrl-0>" = "tab-focus 10";
      };

      insert = {
        "<Ctrl-w>" = "tab-close";
        "<Ctrl-n>" = "open -w";
        "<Ctrl-1>" = "tab-focus 1";
        "<Ctrl-2>" = "tab-focus 2";
        "<Ctrl-3>" = "tab-focus 3";
        "<Ctrl-4>" = "tab-focus 4";
        "<Ctrl-5>" = "tab-focus 5";
        "<Ctrl-6>" = "tab-focus 6";
        "<Ctrl-7>" = "tab-focus 7";
        "<Ctrl-8>" = "tab-focus 8";
        "<Ctrl-9>" = "tab-focus 9";
        "<Ctrl-0>" = "tab-focus 10";
      };
    };
  };
}
