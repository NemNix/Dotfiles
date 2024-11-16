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
          display-messages = false;
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
        space.q = ":wq";
        space.space = ":w";

        C-q = ":wq";
        C-a = "select_all";

        space.p = [ ":vsplit-new" ":insert-output python main.py" ];
        space.m = [ ":sh foot @ send-text --match 'title:^Terminal' 'clear \\python main.py \\n'" ];
        space.c = [ ":sh foot @ send-text --match 'title:^Terminal' 'clear \\ncargo test \\n'" ];

        del = ":buffer-close!";
        esc = [ "collapse_selection" "keep_primary_selection" ];
      };
    };

    # --------------------------------
    # languages Configuration 
    # --------------------------------

    languages = {

      language = [
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
          auto-format = true;
          language-servers = [ "pyright" ];
          formatter = { command = "${pkgs.black}/bin/black"; args = [ "--quiet" "-" ]; };
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
            # cargo.features = "all";
            completion.autoimport.enable = true;
            check = { command = "${pkgs.clippy}/bin/cargo-clippy"; };
            checkOnSave.command = "${pkgs.clippy}/bin/cargo-clippy";
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
