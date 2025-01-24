{ pkgs, inputs, ... }:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    package = inputs.helix.packages.${pkgs.system}.helix;

    settings = {

      # ================================================================================================
      # Helix config
      # ================================================================================================

      editor = {
        auto-pairs = true;
        true-color = true;
        color-modes = true;
        bufferline = "multiple";
        continue-comments = false;

        end-of-line-diagnostics = "hint";
        inline-diagnostics.cursor-line = "error";
        inline-diagnostics.other-lines = "info";

        lsp = {
          display-messages = true;
          display-inlay-hints = true;
        };

        statusline = {
          separator = "│";
          mode.normal = "NORMAL";
          mode.insert = "INSERT";
          mode.select = "SELECT";
          left = [ "mode" "spinner" ];
          center = [ "file-name" ];
          right = [ "diagnostics" "version-control" ];
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

    # ================================================================================================
    # languages Configuration 
    # ================================================================================================

    languages = {

      language = [
        {
          name = "c";
          auto-format = true;
          indent = { tab-width = 4; unit = "    "; };
          formatter = { command = "${pkgs.clang-tools}/bin/clang-format"; args = [ "--style=LLVM" ]; };
        }
        {
          name = "nix";
          auto-format = true;
          formatter = { command = "${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt"; };
        }
        {
          name = "bash";
          auto-format = true;
          formatter = { command = "${pkgs.shfmt}/bin/shfmt"; args = [ "-i" "2" "-ci" ]; };
        }
        {
          name = "python";
          auto-format = true;
          language-servers = [ "pyright" "ruff" ];
          formatter = { command = "${pkgs.ruff}/bin/ruff"; args = [ "format" "-" "--quiet" ]; };
          # formatter = { command = "${pkgs.black}/bin/black"; args = [ "--quiet" "-" "--line-length=80" ]; };
        }
        {
          name = "markdown";
          auto-format = true;
          formatter = { command = "${pkgs.dprint}/bin/dprint "; args = [ "fmt" "--stdin" "md" ]; };
        }
        {
          name = "latex";
          language-servers = [ "texlab" "ltex" ];
          indent = { tab-width = 4; unit = "\t"; };
        }
      ];

      # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      # Language Server Protocol Configuration 
      # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

      language-server.ruff = {
        command = "ruff-lsp";
        config.setting = { args = [ "--ignore" "E501" ]; };
      };

      # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      # Language Debugger
      # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    };

    # ================================================================================================
    # Needed Packages
    # ================================================================================================

    extraPackages = with pkgs; [

      lldb
      clang
      clang-tools
      clang-analyzer

      pyright
      ruff-lsp
      python313Packages.debugpy

      texlab
      ltex-ls-plus

      marksman
      markdown-oxide

      nixd
      nodePackages.bash-language-server
    ];
  };
}

