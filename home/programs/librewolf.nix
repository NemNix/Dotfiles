{
  programs.librewolf = {
    enable = true;
    settings = {
      "browser.sessionstore.resume_from_crash" = false;
      "DisableSystemAddonUpdate" = true;
      "DisableSetDesktopBackground" = true;
    };
  };
}
