{ pkgs, inputs, ... }:
{
  programs.helix = {
    enable = true;
    package = inputs.helix.packages.${pkgs.system}.helix;
    defaultEditor = true;

    settings = {

      # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      # Helix config
      # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      editor = {
        color-modes = true;
        shell = [ "bash" "-c" ];
        bufferline = "multiple";
        line-number = "relative";
        end-of-line-diagnostics = "hint";

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
          name = "c";
          auto-format = true;
          language-servers = [ "clangd" ];
          indent = { tab-width = 8; unit = "    "; };
          formatter = { command = "${pkgs.clang-tools}/bin/clang-format"; args = [ "--style=Gnu" ]; };
        }
        {
          name = "nix";
          auto-format = true;
          language-servers = [ "nixd" ];
          formatter = { command = "${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt"; };
        }
        {
          name = "rust";
          auto-format = true;
          language-servers = [ "rust-analyzer" ];
          formatter = { command = "${pkgs.rustfmt}/bin/rustfmt"; };
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
          formatter = { command = "${pkgs.black}/bin/black"; args = [ "--quiet" "-" "--line-length=100" ]; };
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

      # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      # Language Debugger
      # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      debugger = [
        {
          name = "debugpy";
          transport = "stdio";
          command = "python3";
          args = [ "-m" "debugpy.adapter" ];
        }
      ];
    };

    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    # Needed Packages
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    extraPackages = with pkgs; [
      nixd

      marksman

      lldb
      clang-tools

      nodePackages.bash-language-server

      pyright
      python313Packages.debugpy

      rust-analyzer
      clippy

      vscode-langservers-extracted
      nodePackages_latest.typescript-language-server
    ];
  };
}
