{
  programs.qutebrowser = {
    enable = false;

    searchEngines = {
      "DEFAULT" = "https://priv.au/search?q={}";
      "d" = "https://duckduckgo.com/?q={}&ia=web";

      "n" = "https://mynixos.com/search?q={}";
      "nixo" = "https://search.nixos.org/options?channel=unstable&query={}";
      "nixp" = "https://search.nixos.org/packages?channel=unstable&query={}";
      "gt" = "https://github.com/search?q={}&type=repositories";
    };

    quickmarks = {
      nwiki = "https://wiki.nixos.org/wiki/NixOS_Wiki";
      nflake = "https://nixos-and-flakes.thiscute.world/introduction/";
      nixy = "https://github.com/anotherhadi/nixy?tab=readme-ov-file";
      nca = "https://github.com/nix-community/awesome-nix";
      nc = "https://github.com/nix-community";

      yb = "https://youatb.unibocconi.it/";
      bk = "https://blackboard.unibocconi.it/ultra/stream";
      pz = "https://piazza.com/class/m0nl57y6g4z1wh";

      om = "https://outlook.office.com/mail/";
      pm = "https://mail.proton.me/u/0/inbox";
      tm = "https://app.tuta.com/mail/";

      mai = "https://chat.mistral.ai/chat";
      cai = "https://claude.ai/new";

      chess = "https://www.chess.com/home";
      lichess = "https://lichess.org/";

      git = "https://github.com/dashboard";
      berg = "https://codeberg.org/PyNEL/Dotfiles";

      box = "http://192.168.1.254/#";
    };

    settings = {

      content = {
        autoplay = false;
        javascript.clipboard = "access";
        prefers_reduced_motion = true;
        cookies.accept = "no-3rdparty";
        pdfjs = true;
      };

      qt = {
        highdpi = true;
      };

      scrolling = {
        bar = "never";
        smooth = true;
      };
    };
  };
}
