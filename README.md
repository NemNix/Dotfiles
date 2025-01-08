<h1 align="center">
  <img src="./assets/nixos.png" width="100px" alt="NixOS Logo" />
  <br>
  NixOS For NEWBIES
  <br>
  <img src="./assets/macchiato.png" width="600px" alt="Macchiato Theme" />
</h1>

## Hyprland
![Hyprland Home Screenshot](./assets/home.png)
![Hyprland File Manager Screenshot](./assets/file.png)
![Hyprland Development Screenshot](./assets/dev.png)

## Sway
![Sway Home Screenshot](./assets/sway.png)
![Sway File Manager Screenshot](./assets/sfile.png)
![Sway Development Screenshot](./assets/sdev.png)

## Core System
- **Shell:** `zsh`
- **Kernel:** CachyOS kernel
- **Distro:** NixOS Unstable

## Window Managers

### Hyprland Ecosystem
| Component | Description | Language |
|-----------|-------------|------------|
| [Hyprland](https://github.com/hyprwm/Hyprland) | Window Manager | ![C++][cpp] |
| [Hyprlock](https://github.com/hyprwm/hyprlock) | Screen locker | ![C++][cpp] |
| [Hypridle](https://github.com/hyprwm/hypridle) | Idle daemon | ![C++][cpp] |
| [Hyprshot](https://github.com/Gustash/Hyprshot) | Screenshot tool | ![Shell][sh] |
| [Hyprpaper](https://github.com/hyprwm/hyprpaper) | Wallpaper manager | ![C++][cpp] |
| [Hyprpicker](https://github.com/hyprwm/hyprpicker) | Color picker | ![C++][cpp] |

### Sway Ecosystem
| Component | Description | Language |
|-----------|-------------|------------
| [Sway](https://github.com/swaywm/sway) | Window Manager | ![C][c] |
| [Swaybg](https://github.com/swaywm/swaybg) | Background setter | ![C][c] |
| [Swaylock](https://github.com/swaywm/swaylock) | Screen locker | ![C][c] |
| [Swayidle](https://github.com/swaywm/swayidle) | Idle management | ![C][c] |

### System Components
| Component | Description | Language |
|-----------|-------------|-----------|
| [Tuigreet](https://github.com/apognu/tuigreet) | Login Manager | ![Rust][rs] |
| [Waybar](https://github.com/Alexays/Waybar) | Status Bar | ![C++][cpp] |
| [Dunst](https://dunst-project.org/) | Notification Daemon | ![C][c] |
| [Wofi](https://gitlab.com/dgirault/wofi) | Application Launcher | ![C][c] |
| [Anyrun](https://github.com/anyrun-org/anyrun) | Modern Application Launcher | ![Rust][rs] |
| [Kanshi](https://git.sr.ht/~emersion/kanshi) | Display Configuration Manager | ![C][c] |
| [wlr-randr](https://sr.ht/~emersion/wlr-randr/) | Display Management Tool | ![C][c] |
| [gpu-screen-recorder-gtk](https://git.dec05eba.com/gpu-screen-recorder-gtk/about/) | Screen Recorder | ![C++][cpp] |

### Applications
| Component | Description | Language |
|-----------|-------------|-----------|
| [Foot](https://codeberg.org/dnkl/foot) | Terminal Emulator | ![C][c] |
| [Helix](https://helix-editor.com/) | Text Editor | ![Rust][rs] |
| [VSCodium](https://github.com/VSCodium/vscodium) | IDE | - |
| [Floorp](https://github.com/Floorp-Projects/Floorp) | Web Browser | - |
| [Yazi](https://github.com/sxyazi/yazi) | Terminal File Manager | ![Rust][rs] |
| [Nautilus](https://github.com/GNOME/nautilus) | File Manager | ![C][c] |
| [Btop](https://github.com/aristocratos/btop) | System Monitor | ![C++][cpp] |


## Repository Structure

### 🏠 Home Directory
Configuration files for user-level settings:
- `programs/`: Home Manager configurations
- `system/`: Window manager system configurations

### 💻 Hosts Directory
Host-specific configurations:
- `modules/`: System configurations divided into modules


# Installation

## Overview
The NixOS Installation Script automates the process of partitioning your disk and installing NixOS. It supports both UEFI and BIOS systems and includes optional swap file creation.

## Prerequisites
- NixOS installation media booted
- Internet connection
- Root/sudo access
- Target disk device name (e.g., /dev/sda, /dev/nvme0n1)

## Usage

### Basic Command
```bash
nixosinstall <device> <type>
```

### Parameters
- `<device>`: The target disk device (e.g., /dev/sda)
- `<type>`: Boot type, either 'uefi' or 'bios'

### Examples
```bash
# For UEFI system on /dev/sda
nixosinstall /dev/sda uefi

# For BIOS system on /dev/nvme0n1
nixosinstall  /dev/nvme0n1 bios
```

## Features

### 1. Disk Partitioning
- **UEFI Setup**:
  - 500MB EFI System Partition (FAT32)
  - Remaining space for root partition (ext4)

- **BIOS Setup**:
  - 500MB boot partition (ext4)
  - Remaining space for root partition (ext4)

### 2. Swap Configuration
- Interactive prompt for swap creation
- Configurable swap size
- Recommendations based on RAM size
- Optional - can be skipped

### 3. NixOS Installation
- Automatic configuration generation
- Option to edit configuration before installation
- Complete system installation
- Post-installation instructions

## Script Flow
1. Validates input parameters
2. Checks device availability
3. Creates partitions based on system type
4. Formats and mounts partitions
5. Handles swap configuration (if chosen)
6. Generates NixOS configuration
7. Allows configuration editing
8. Performs system installation

## Post-Installation Steps
After running the script and rebooting:
1. Log in as root
2. Set root password using `passwd`
3. Create user using `adduser <username>`
3. Set user passwords using `passwd username`

## Notes
- The script requires root privileges
- Make sure to choose the correct device name
- Configuration can be edited at `/mnt/etc/nixos/configuration.nix`

## Troubleshooting
If you encounter issues:
1. Check that you're running from NixOS installation media
2. Verify the device name is correct
3. Ensure you have internet connectivity
4. Check system logs if installation failsy

<!-- Badge Definitions -->
[rs]: https://img.shields.io/badge/-rust-orange
[nim]: https://img.shields.io/badge/-nim-%23ffe953
[sh]: https://img.shields.io/badge/-shell-green
[go]: https://img.shields.io/badge/-go-68D7E2
[cpp]: https://img.shields.io/badge/-c%2B%2B-red
[c]: https://img.shields.io/badge/-c-lightgrey
[z]: https://img.shields.io/badge/-zig-yellow
[va]: https://img.shields.io/badge/-vala-blueviolet
[da]: https://img.shields.io/badge/-dart-02D3B3
[py]: https://img.shields.io/badge/-python-blue
[ts]: https://img.shields.io/badge/-TS-007BCD
