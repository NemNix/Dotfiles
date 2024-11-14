{ pkgs, ... }:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;

    settings = {

      editor = {
        color-modes = true;
        statusline = {
          left = [ "mode" "spinner" ];
          center = [ "file-name" ];
          right = [ "diagnostics" "version-control" ];
          separator = "│";
          mode.normal = "NORMAL";
          mode.insert = "INSERT";
          mode.select = "SELECT";
        };
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
      };

      keys.normal = {
        space.space = ":w";
        space.q = ":wq";
        esc = [ "collapse_selection" "keep_primary_selection" ];
      };
    };

    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    # languages Configuration 
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    languages = {

      language = [
        {
          name = "nix";
          auto-format = true;
          language-servers = [ "nixd" "nil" ];
          formatter = {
            command = "${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt";
            # command = "${pkgs.nixfmt-rfc-style}/bin/nixfmt";
            # command = "${pkgs.alejandra}/bin/alejandra";
          };
        }

        {
          name = "bash";
          auto-format = true;
          language-servers = [ "bash-language-server" ];
          formatter = {
            command = "${pkgs.shfmt}/bin/shfmt";
            args = [ "-i" "2" "-ci" ];
          };
        }

        {
          name = "python";
          auto-format = true;
          language-servers = [ "pyright" ];
          formatter = {
            command = "${pkgs.black}/bin/black";
            args = [ "--quiet" "-" ];
          };
        }

        {
          name = "rust";
          auto-format = false;
          file-types = [ "rs" ];
          language-servers = [ "rust-analyzer" ];
          formatter = { command = "${pkgs.rustfmt}/bin/rustfmt"; };
        }

        {
          name = "zig";
          auto-format = true;
          language-servers = [ "zsl" ];
          formatter = { command = "${pkgs.zig}/bin/zig"; };
        }

        {
          name = "html";
          auto-format = true;
          language-servers = [ "vscode-langservers-extracted" ];
        }

        {
          name = "javascript";
          auto-format = true;
          language-servers = [ "typescript-language-server" ];
        }
      ];

      # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      # Language Server Protocol Configuration 
      # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

      language-servers = {

        nil = { command = "${pkgs.nixd}/bin/nixd"; };

        rust-analyzer = {
          config = {
            check = { command = "${pkgs.clippy}/bin/cargo-clippy"; };
            # cargo.features = "all";
            checkOnSave.command = "${pkgs.clippy}/bin/cargo-clippy";
            completion.autoimport.enable = true;
          };
        };

        typescript-language-server = {
          command = "${pkgs.nodePackages_latest.typescript-language-server}/bin/typescript-language-server";
          args = [ "--stdio" ];
        };
      };
    };

    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    # Needed Packages
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    extraPackages = with pkgs; [
      # DEBUG
      lldb_18

      # lldb-vscode :
      # c
      # cpp

      # = < NIX > =
      # = Language Server Protocol =
      nil
      nixd
      # = DAP =

      # = Formatter =
      # nixfmt
      nixfmt-rfc-style
      # alejandra

      # = < Bash > =
      # = Language Server Protocol =
      nodePackages.bash-language-server
      # = DAP =
      # = Formatter =
      shfmt

      # = < Python > =
      # = Language Server Protocol =
      pyright
      # = DAP =
      # = Formatter =
      black

      # = < Rust > =
      # = Language Server Protocol =
      rust-analyzer
      # = DAP =
      lldb
      # = Formatter =
      # rust-fmt
      clippy # Good place ?

      # = < lua > =
      # = Language Server Protocol =
      lua-language-server
      # = DAP =
      # = Formatter =

      # = < Zig > =
      # = Language Server Protocol =
      zls
      # = DAP =
      # lldb (commented because already called)
      # = Formatter =
      zig

      # = < HTML > =
      # = Language Server Protocol =
      # vscode-html-language-server
      vscode-langservers-extracted
      # = DAP =
      # = Formatter =

      # = < CSS > =
      # = Language Server Protocol =
      nodePackages_latest.typescript-language-server
      # = DAP =
      # = Formatter =

      # = Language Server Protocol =
      docker-compose-language-service
      dockerfile-language-server-nodejs
      yaml-language-server
      ansible-language-server
    ];
  };
}
