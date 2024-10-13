{
  pkgs-unstable,
  ...
}:
{
  nixpkgs.config.cudaSupport = true;

  services.ollama = {
    package = pkgs-unstable.ollama;
    enable = true;
    acceleration = "cuda";
  };

  services.open-webui = {
    package = pkgs-unstable.open-webui;
    enable = true;
    host = "0.0.0.0";
    openFirewall = true;
  };
}
