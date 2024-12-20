{ hostname, inputs, ... }:
{
  # ---------------------------------------------------------
  # Documentation
  # ---------------------------------------------------------

  documentation = {
    enable = false;
    doc.enable = false;
    man.enable = false;
    dev.enable = false;
    info.enable = false;
    nixos.enable = false;
  };

  # ---------------------------------------------------------
  # System
  # ---------------------------------------------------------

  system = { stateVersion = "24.11"; };

  hardware.graphics = {
    enable = true;
    # enable32Bit = true;
  };

  services = {
    colord.enable = true;
    chrony.enable = true;
    logind = { lidSwitch = "ignore"; lidSwitchExternalPower = if hostname == "server" then "ignore" else "suspend-then-hibernate"; };
  };

  systemd = {
    tpm2.enable = false;
    services.sertimesyncd.enable = false;
  };

  console.colors = [
    "1e1e2e" # base
    "181825" # mantle
    "313244" # surface0
    "45475a" # surface1
    "585b70" # surface2
    "cdd6f4" # text
    "f5e0dc" # rosewater
    "b4befe" # lavender
    "f38ba8" # red
    "fab387" # peach
    "f9e2af" # yellow
    "a6e3a1" # green
    "94e2d5" # teal
    "89b4fa" # blue
    "cba6f7" # mauve
    "f2cdcd" # flamingo
    "181825" # mantle - darker background
    "11111b" # crust - darkest background
    "eba0ac" # maroon - bright red
    "f5e0dc" # rosewater - bright yellow
    "a6e3a1" # green - bright green
    "89dceb" # sky - bright cyan
    "74c7ec" # sapphire - bright blue
    "f5c2e7" # pink - bright purple];
  ];
}
