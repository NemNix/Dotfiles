{
  inputs,
  system,
  ...
}:

let
  unstablePkgs = import inputs.nixpkgs-unstable {
    inherit system;
    config = {
      allowUnfree = true;
    };
  };
in
{
  nixpkgs.config.cudaSupport = true;

  services.ollama = {
    package = unstablePkgs.ollama;
    enable = true;
    acceleration = "cuda";
  };

  services.open-webui = {
    package = unstablePkgs.open-webui;
    enable = true;
    host = "0.0.0.0";
    openFirewall = true;
  };
}
