{
  # nixpkgs.config.cudaSupport = true;
  nixpkgs.config.rocmSupport = true;

  services = {

    ollama = {
      enable = true;
      acceleration = false;
    };

    nextjs-ollama-llm-ui.enable = false;

    open-webui = {
      enable = false;
      host = "0.0.0.0";
      openFirewall = true;
    };
  };
}
