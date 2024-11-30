{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    hyprpolkitagent.url = "github:hyprwm/hyprpolkitagent";

    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
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
          username = "nem";
          hostname = "laptop";
        };
      };

      server = nixpkgs.lib.nixosSystem {
        modules = [ ./hosts ];
        specialArgs = {
          inherit inputs;
          username = "nem";
          hostname = "server";
        };
      };
    };
  };
}
