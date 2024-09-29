{
  nix = {
    optimise = {
      automatic = true;
      dates = ["daily"];
    };

    settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
      substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    };
  };

  documentation = {
    enable = false;
    doc.enable = false;
    man.enable = true;
    dev.enable = false;
  };

  i18n.defaultLocale = "en_US.UTF-8";
  time.timeZone = "Europe/Rome";

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.05";
}
