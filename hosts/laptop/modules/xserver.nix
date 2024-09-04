{pkgs, ...}: {
  services.xserver = {
    enable = true;
    xkb.layout = "fr";
    xkb.variant = "";
    excludePackages = [pkgs.xterm];
  };

  console.keyMap = "fr";
}
