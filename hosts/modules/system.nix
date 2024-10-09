{
  username,
  pkgs,
  ...
}: {
  i18n.defaultLocale = "en_US.UTF-8";
  time.timeZone = "Europe/Rome";
  system.stateVersion = "24.05";
  environment.systemPackages = [pkgs.cachix];
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  nix = {
    optimise = {
      automatic = true;
      dates = ["daily"];
    };

    settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
      trusted-users = ["${username}"];
      substituters = [
        "https://cache.nixos.org"
        "https://hyprland.cachix.org"
        "https://cuda-maintainers.cachix.org"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
      ];
    };
  };
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  documentation = {
    enable = false;
    doc.enable = false;
    man.enable = true;
    dev.enable = false;
    info.enable = false;
    nixos.enable = false;
  };
}
