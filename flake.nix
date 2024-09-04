{
  description = "! Nixos Flake !";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    alejandra.url = "github:kamadorueda/alejandra/3.0.0";

    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };

    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    self,
    ...
  } @ inputs: let
    username = "nel";
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
      overlays = [
        inputs.hyprpanel.overlay
      ];
    };
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [(import ./hosts/laptop)];
        specialArgs = {
          host = "laptop";
          inherit self inputs username pkgs;
        };
      };
    };
  };
}
