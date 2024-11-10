{ pkgs, username, ... }:
{
  users.users.${username}.extraGroups = [ "libvirtd" ];
  boot.kernel.sysctl = { "vm.max_map_count" = 2147483642; };

  environment.systemPackages = with pkgs; [
    qemu
    qemu_kvm
    adwaita-icon-theme
  ];

  virtualisation = {
    libvirtd = {
      enable = true;

      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = true;
        swtpm.enable = true;

        ovmf = {
          enable = true;
          packages = [ (pkgs.OVMF.override { secureBoot = true; tpmSupport = true; }).fd ];
        };
      };
    };
  };
}
