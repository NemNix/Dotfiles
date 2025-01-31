{ pkgs, modulesPath, ... }:

let
  nixosinstall = pkgs.writeScriptBin "nixosinstall"
    ''
      #!/bin/bash

      set -e

      if [ "$#" -ne 2 ]; then
        echo "Usage: $0 <device> <type>"
        echo "Types: uefi, bios"
        exit 1
      fi

      DEVICE=$1
      TYPE=$2

      if [ ! -b "$DEVICE" ]; then
        echo "Error: Device $DEVICE not found"
        exit 1
      fi

      if mount | grep -q "$DEVICE"; then
        echo "Error: Device $DEVICE is mounted. Please unmount first."
        exit 1
      fi

      create_uefi_partitions() {

        parted -s "$DEVICE" mklabel gpt

        parted -s "$DEVICE" mkpart primary fat32 2048s 500MB
        parted -s "$DEVICE" set 1 esp on

        parted -s "$DEVICE" mkpart primary ext4 500MB 100%

        mkfs.fat -F 32 "\${DEVICE}1"
        mkfs.ext4 "\${DEVICE}2"

        fatlabel "${DEVICE}1" NIXBOOT
        e2label "${DEVICE}2" NIXROOT
      }

      create_bios_partitions() {

        parted -s "$DEVICE" mklabel msdos

        parted -s "$DEVICE" mkpart primary ext4 2048s 500MB
        parted -s "$DEVICE" set 1 boot on

        parted -s "$DEVICE" mkpart primary ext4 500MB 100%

        mkfs.ext4 "${DEVICE}1"
        mkfs.ext4 "${DEVICE}2"

        e2label "${DEVICE}1" NIXBOOT
        e2label "${DEVICE}2" NIXROOT
      }

      mount_partitions() {

        mkdir -p /mnt
        mkdir -p /mnt/boot

        mount /dev/disk/by-label/NIXROOT /mnt

        mount /dev/disk/by-label/NIXBOOT /mnt/boot
      }

      create_swap() {
        local swap_size=$1
        dd if=/dev/zero of=/mnt/.swapfile bs=1024 count="$swap_size"
        chmod 600 /mnt/.swapfile
        mkswap /mnt/.swapfile
        swapon /mnt/.swapfile
        echo "Swap file created and activated"
      }

      configure_swap() {
        read -r -p "Do you want to create a swap file? (y/n): " want_swap
        if [[ $want_swap =~ ^[Yy]$ ]]; then
          echo "Recommended swap sizes:"
          echo "RAM < 2GB: 2x RAM size"
          echo "2GB-8GB RAM: Equal to RAM size"
          echo "8GB-16GB RAM: Half of RAM size"
          echo ">16GB RAM: 4GB to 8GB (or RAM size if hibernation needed)"
          echo
          echo "Enter swap size in GB (e.g., 4 for 4GB):"

          read -r swap_gb
          if [[ $swap_gb =~ ^[0-9]+$ ]]; then
            local swap_size=$((swap_gb * 1024 * 1024)) # Convert GB to KB
            create_swap $swap_size
          else
            echo "Invalid input. Skipping swap creation."
          fi
        else
          echo "Skipping swap file creation"
        fi
      }

      # Function to perform NixOS installation
      install_nixos() {
        echo "Generating NixOS configuration..."
        nixos-generate-config --root /mnt

        echo "Configuration generated. You can now edit the configuration file:"
        echo "Edit /mnt/etc/nixos/configuration.nix to set up:"
        echo "- Keyboard layout"
        echo "- User accounts"
        echo "- Network configuration"
        echo "- Boot loader settings"

        read -r -p "Would you like to edit the configuration now? (y/n): " edit_config
        if [[ $edit_config =~ ^[Yy]$ ]]; then
          nano /mnt/etc/nixos/configuration.nix
        fi

        echo "Starting NixOS installation..."
        cd /mnt
        nixos-install

        echo "Installation complete!"
        echo "Remember to set your root password after reboot using 'passwd'"
      }

      echo "Starting partitioning process for $DEVICE using $TYPE configuration..."

      case $TYPE in
        uefi) create_uefi_partitions ;;
        bios) create_bios_partitions ;;
        *)
          echo "Error: Invalid type. Use 'uefi' or 'bios'"
          exit 1
          ;;
      esac

      mount_partitions

      configure_swap

      install_nixos

      echo "NixOS installation completed successfully!"
      echo "You can now reboot your system."
      echo
      echo "After reboot, remember to:"
      echo "1. Log in as root"
      echo "2. Set up your root password using 'passwd'"
      echo "3. Set up user using 'adduser username'"
      echo "4. Set up user passwords using 'passwd username'"
    '';
in
{
  # Base ISO configuration
  imports = [
    (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix")
  ];

  # Network configuration
  boot.initrd.systemd.network.wait-online.enable = false;
  systemd.services.NetworkManager-wait-online.enable = false;

  networking = {
    hostName = "iso";
    firewall.enable = true;

    wireless = {
      enable = false;
      iwd.enable = false;
    };

    networkmanager = {
      enable = true;
      wifi.backend = "wpa_supplicant";
    };
  };

  # Disable documentation to reduce image size
  documentation = {
    enable = false;
    doc.enable = false;
    man.enable = false;
    dev.enable = false;
    info.enable = false;
    nixos.enable = false;
  };

  # Essential packages
  environment.systemPackages = with pkgs; [
    yazi # Terminal file manager
    helix # Modern text editor
    nixosinstall
  ];

  # ISO image configuration
  # See: https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/installer/cd-dvd/iso-image.nix
  isoImage = {
    compressImage = false;
    includeSystemBuildDependencies = false;
    squashfsCompression = "zstd -Xcompression-level 19";
  };
}
