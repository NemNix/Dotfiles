{ inputs, ... }:
{
  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = "x86_64-linux";
  };

  nix = {
    channel.enable = false;
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

    optimise = {
      automatic = true;
      dates = [ "daily" ];
    };

    settings = {
      show-trace = true;
      auto-optimise-store = true;
      builders-use-substitutes = true;
      experimental-features = [ "nix-command" "flakes" ];

      substituters = [
        "https://helix.cachix.org"
        "https://anyrun.cachix.org"
        "https://hyprland.cachix.org"
        "https://nix-community.cachix.org"
        "https://cuda-maintainers.cachix.org"
      ];

      trusted-public-keys = [
        "helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs="
        "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
      ];
    };
  };
}
