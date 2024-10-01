{
  services = {
    ollama = {
      enable = true;
      acceleration = "cuda";
    };

    open-webui = {
      enable = true;
      openFirewall = true;
    };
  };
}
