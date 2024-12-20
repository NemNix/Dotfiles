{
  # ---------------------------------------------------------
  # Nix
  # ---------------------------------------------------------
  nixpkgs = { config = { allowUnfree = true; }; };

  nix = {
    channel.enable = false;

    optimise = {
      automatic = true;
      dates = [ "daily" ];
    };

    settings = {
      show-trace = true;
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];

      system-features = [
        "kvm"
        "big-parallel"
        "gccarch-skylake"
      ];

      substituters = [
        "https://hyprland.cachix.org"
        "https://nix-community.cachix.org"
        "https://cuda-maintainers.cachix.org"
      ];

      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
      ];
    };
  };
}
