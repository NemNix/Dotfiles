{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    #chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };

    alejandra = {
      url = "github:kamadorueda/alejandra/3.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:MarceColl/zen-browser-flake";
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

  outputs = {nixpkgs, ...} @ inputs: {
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        modules = [./hosts/laptop];
        specialArgs = {
          inherit inputs;
          username = "nel";
          hostname = "laptop";
        };
      };
      server = nixpkgs.lib.nixosSystem {
        modules = [./hosts/server];
        specialArgs = {
          inherit inputs;
          username = "nel";
          hostname = "server";
        };
      };
    };
  };
}
