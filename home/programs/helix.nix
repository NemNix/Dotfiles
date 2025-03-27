{ pkgs, inputs, ... }:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    package = pkgs.helix;
    # package = inputs.helix.packages.${pkgs.system}.helix;

    settings = {

      # ================================================================================================
      # Helix config
      # ================================================================================================

      theme = "catppuccin_mocha";

      editor = {
        auto-pairs = true;
        true-color = true;
        color-modes = true;
        bufferline = "multiple";
        continue-comments = false;
        completion-replace = true;

        end-of-line-diagnostics = "hint";
        inline-diagnostics.other-lines = "info";
        inline-diagnostics.cursor-line = "warning";

        lsp = {
          display-inlay-hints = true;
          display-progress-messages = true;
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
        space.p = "@:sh python <C-r>%<ret>";
        space.c = "@:sh gcc <C-r>%<ret> && ./main";

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
          formatter = { command = "${pkgs.ruff}/bin/ruff"; args = [ "format" "-" ]; };
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

      language-server = {

        nixd = {
          command = "${pkgs.nixd}/bin/nixd";
        };

        ruff = {
          command = "${pkgs.ruff}/bin/ruff";
          args = [ "server" "--preview" ];
          config.setting = { organizeImports = true; };
        };

        clangd = {
          command = "clangd";
          args = [ "--clang-tidy" "-j=5" "--malloc-trim" ];
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

        ruff
        pyright
        python313Packages.debugpy

        texlab
        ltex-ls-plus

        marksman
        markdown-oxide

        nixd
        nodePackages.bash-language-server
      ];
    };
  };
}

