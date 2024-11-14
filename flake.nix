{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    hyprsunset.url = "github:hyprwm/hyprsunset";
    hyprsysteminfo.url = "github:/hyprwm/hyprsysteminfo";
    hyprpolkitagent.url = "github:hyprwm/hyprpolkitagent";

    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.1";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.pre-commit-hooks-nix.follows = "";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, ... } @inputs: {

    nixosConfigurations = {

      laptop = nixpkgs.lib.nixosSystem {
        modules = [ ./hosts ];
        specialArgs = {
          inherit inputs;
          username = "nel";
          hostname = "laptop";
        };
      };

      server = nixpkgs.lib.nixosSystem {
        modules = [ ./hosts ];
        specialArgs = {
          inherit inputs;
          username = "nel";
          hostname = "server";
        };
      };

      iso = nixpkgs.lib.nixosSystem {
        modules = [
          "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-graphical-gnome.nix"
          ./hosts
        ];
        specialArgs = {
          inherit inputs;
          username = "nel";
          hostname = "laptop";
        };
      };
    };
  };
}
