{
  pkgs,
  ...
}:
{
  nixpkgs.config.cudaSupport = true;

  services.ollama = {
    package = pkgs.ollama;
    enable = true;
    acceleration = "cuda";
  };

  services.open-webui = {
    package = pkgs.open-webui;
    enable = true;
    host = "0.0.0.0";
    openFirewall = true;
  };
}
