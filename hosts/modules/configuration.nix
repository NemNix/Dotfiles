{ hostname, inputs, ... }:
{
  documentation = {
    enable = false;
    doc.enable = false;
    man.enable = false;
    dev.enable = false;
    info.enable = false;
    nixos.enable = false;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services = {
    logind = {
      lidSwitch = "ignore";
      lidSwitchExternalPower = if hostname == "server" then "ignore" else "suspend-then-hibernate";
    };
  };


  system = {
    stateVersion = "24.05";
    switch = {
      enable = false;
      enableNg = true;
    };
  };

  nixpkgs = { config = { allowUnfree = true; }; };

  nix = {
    daemonCPUSchedPolicy = "batch";
    channel.enable = false;
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

    optimise = {
      automatic = true;
      dates = [ "daily" ];
    };

    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];

      substituters = [
        "https://cache.nixos.org"
        "https://hyprland.cachix.org"
        "https://nix-community.cachix.org"
        "https://cuda-maintainers.cachix.org"
      ];

      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
      ];
    };
  };
}
