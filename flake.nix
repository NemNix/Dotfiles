{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
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
    };
  };
}
