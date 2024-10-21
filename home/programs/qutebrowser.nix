{
  programs.qutebrowser = {
    enable = false;

    searchEngines = {
      "DEFAULT" = "https://duckduckgo.com/?q={}&ia=web";
      "d" = "https://duckduckgo.com/?q={}&ia=web";
      "g" = "https://google.com/search?q={}";
      "gt" = "https://github.com/search?q={}&type=repositories";

      "n" = "https://mynixos.com/search?q={}";
      "nixo" = "https://search.nixos.org/options?channel=unstable&query={}";
      "nixp" = "https://search.nixos.org/packages?channel=unstable&query={}";
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
