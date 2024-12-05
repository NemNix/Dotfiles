{
  programs.librewolf = {
    enable = true;
    settings = {


      "browser.sessionstore.resume_from_crash" = false;


      "privacy.clearOnShutdown.history" = false;
      "privacy.clearOnShutdown.downloads" = false;
      "DisableSetDesktopBackground" = true;
    };
  };
}
