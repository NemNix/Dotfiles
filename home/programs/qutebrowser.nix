{
  programs.qutebrowser = {
    enable = true;

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
        force_software_rendering = "chromium";
        highdpi = false;
      };
      scrolling = {
        bar = "never";
        smooth = true;
      };
    };
  };
}
