{ pkgs, modulesPath, ... }:

let
  nixosinstall = pkgs.writeScriptBin "nixosinstall" ''
    #!/bin/bash

    set -e

    if [ "$#" -ne 2 ]; then
      echo "Usage: $0 <device> <type>"
      echo "Types: uefi, bios"
      exit 1
    fi

    DEVICE=$1
    TYPE=$2

    # Verify device exists
    if [ ! -b "$DEVICE" ]; then
      echo "Error: Device $DEVICE not found"
      exit 1
    fi

    # Verify device is not mounted
    if mount | grep -q "$DEVICE"; then
      echo "Error: Device $DEVICE is mounted. Please unmount first."
      exit 1
    fi

    # Function to create UEFI partitions
    create_uefi_partitions() {
      # Create GPT partition table
      parted -s "$DEVICE" mklabel gpt

      # Create EFI partition
      parted -s "$DEVICE" mkpart primary fat32 2048s 500MB
      parted -s "$DEVICE" set 1 esp on

      # Create root partition
      parted -s "$DEVICE" mkpart primary ext4 500MB 100%

      # Format partitions
      mkfs.fat -F 32 ''${DEVICE}1"
      mkfs.ext4 ''${DEVICE}2"

      # Label partitions
      fatlabel ''${DEVICE}1" NIXBOOT
      e2label ''${DEVICE}2" NIXROOT
    }

    # Function to create BIOS partitions
    create_bios_partitions() {
      # Create MBR partition table
      parted -s "$DEVICE" mklabel msdos

      # Create boot partition
      parted -s "$DEVICE" mkpart primary ext4 2048s 500MB
      parted -s "$DEVICE" set 1 boot on

      # Create root partition
      parted -s "$DEVICE" mkpart primary ext4 500MB 100%

      # Format partitions
      mkfs.ext4 ''${DEVICE}1"
      mkfs.ext4 ''${DEVICE}2"

      # Label partitions
      e2label ''${DEVICE}1" NIXBOOT
      e2label ''${DEVICE}2" NIXROOT
    }

    # Function to mount partitions
    mount_partitions() {
      # Create mount points
      mkdir -p /mnt
      mkdir -p /mnt/boot

      # Mount root partition
      mount /dev/disk/by-label/NIXROOT /mnt

      # Mount boot partition
      mount /dev/disk/by-label/NIXBOOT /mnt/boot
    }

    # Function to create swap file
    create_swap() {
      local swap_size=$1
      dd if=/dev/zero of=/mnt/.swapfile bs=1024 count=$swap_size
      chmod 600 /mnt/.swapfile
      mkswap /mnt/.swapfile
      swapon /mnt/.swapfile
      echo "Swap file created and activated"
    }

    # Function to ask about swap
    configure_swap() {
      read -p "Do you want to create a swap file? (y/n): " want_swap
      if [[ $want_swap =~ ^[Yy]$ ]]; then
        echo "Recommended swap sizes:"
        echo "RAM < 2GB: 2x RAM size"
        echo "2GB-8GB RAM: Equal to RAM size"
        echo "8GB-16GB RAM: Half of RAM size"
        echo ">16GB RAM: 4GB to 8GB (or RAM size if hibernation needed)"
        echo
        echo "Enter swap size in GB (e.g., 4 for 4GB):"
        read swap_gb
        if [[ $swap_gb =~ ^[0-9]+$ ]]; then
          # Convert GB to KB (multiply by 1024 * 1024)
          local swap_size=$((swap_gb * 1024 * 1024))
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

      read -p "Would you like to edit the configuration now? (y/n): " edit_config
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

    # Create partitions based on type
    case $TYPE in
      uefi) create_uefi_partitions ;;
      bios) create_bios_partitions ;;
      *)
        echo "Error: Invalid type. Use 'uefi' or 'bios'"
        exit 1
        ;;
    esac

    # Mount partitions
    mount_partitions

    # Ask about swap configuration
    configure_swap

    # Perform NixOS installation
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
