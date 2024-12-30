{ pkgs, ... }:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;

    settings = {

      # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      # Helix config
      # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      editor = {
        color-modes = true;

        bufferline = "multiple";
        shell = [ "bash" "-c" ];

        statusline = {
          separator = "│";
          mode.normal = "NORMAL";
          mode.insert = "INSERT";
          mode.select = "SELECT";
          left = [ "mode" "spinner" ];
          center = [ "file-name" ];
          right = [ "diagnostics" "version-control" ];
        };

        lsp = {
          display-messages = true;
          display-inlay-hints = true;
        };

        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
      };

      # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      # Keybindings 
      # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      keys.normal = {
        space.q = ":q";
        space.space = ":w";

        C-q = ":q!";

        del = ":buffer-close!";
        esc = [ "collapse_selection" "keep_primary_selection" ];
      };
    };

    # --------------------------------
    # languages Configuration 
    # --------------------------------

    languages = {

      language = [
        # {
        #   name = "kdl";
        #   auto-format = true;
        #   formatter = { command = "${pkgs.kdlfmt}/bin/kdlfmt"; };
        # }
        {
          name = "nix";
          auto-format = true;
          language-servers = [ "nil" ];
          formatter = { command = "${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt"; };
        }
        {
          name = "bash";
          auto-format = true;
          language-servers = [ "bash-language-server" ];
          formatter = { command = "${pkgs.shfmt}/bin/shfmt"; args = [ "-i" "2" "-ci" ]; };
        }
        {
          name = "python";
          auto-format = false;
          language-servers = [ "pyright" ];
          formatter = { command = "${pkgs.black}/bin/black"; args = [ "--quiet" "-" "--line-length=100" ]; };
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
      # = DAP =

      # = Formatter =
      # nixfmt
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
