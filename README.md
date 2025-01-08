<h1 align="center">
  <img src="./assets/nixos.png" width="100px" alt="NixOS Logo" />
  <br>
  NixOS For NEWBIES
  <br>
  <img src="./assets/macchiato.png" width="600px" alt="Macchiato Theme" />
</h1>=

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

## System Components
| Category | Component | Description | Language |
|----------|-----------|-------------|-----------|
| Login | [Tuigreet](https://github.com/apognu/tuigreet) | Login Manager | ![Rust][rs] |
| Interface | [Waybar](https://github.com/Alexays/Waybar) | Status Bar | ![C++][cpp] |
| Interface | [Dunst](https://dunst-project.org/) | Notification Daemon | ![C][c] |
| Launchers | [Wofi](https://gitlab.com/dgirault/wofi) | Application Launcher | ![C][c] |
| Launchers | [Anyrun](https://github.com/anyrun-org/anyrun) | Modern Application Launcher | ![Rust][rs] |
| Display | [Kanshi](https://git.sr.ht/~emersion/kanshi) | Display Configuration Manager | ![C][c] |
| Display | [wlr-randr](https://sr.ht/~emersion/wlr-randr/) | Display Management Tool | ![C][c] |
| Media | [gpu-screen-recorder-gtk](https://git.dec05eba.com/gpu-screen-recorder-gtk/about/) | Screen Recording Tool | ![C++][cpp] |

## Applications
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

## 🏠 Home Directory
Configuration files for user-level settings:
- `programs/`: Home Manager configurations
- `system/`: Window manager system configurations

## 💻 Hosts Directory
Host-specific configurations:
- `modules/`: System configurations divided into modules

## Installation
- Installation script (coming soon)

## Todo List
- [ ] Declare Browser configuration
- [ ] Remove unused configurations

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
