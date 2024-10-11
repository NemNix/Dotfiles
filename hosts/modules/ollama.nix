{
  config,
  pkgs,
  inputs,
  system,
  ...
}: {
  nixpkgs.config.cudaSupport = true;

  services.ollama = {
    package = inputs.nixpkgs-unstable.legacyPackages.${system}.ollama;
    enable = true;
    acceleration = "cuda";
  };

  services.open-webui = {
    package = inputs.nixpkgs-unstable.legacyPackages.${system}.open-webui;
    enable = true;
    host = "0.0.0.0";
    openFirewall = true;
  };
}
