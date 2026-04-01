{ config, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    # ----------------------------------------------------------
    extraPackages = with pkgs; [

      # --- Treesitter CLI + compiler ---
      tree-sitter
      gcc

      # --- LSP servers ---
      lua-language-server
      nil
      nodePackages.typescript-language-server
      nodePackages.vscode-langservers-extracted
      pyright

      # --- Formatters ---
      stylua
      prettier
      black
      nixpkgs-fmt

      # --- Precompiled Treesitter grammars (NixOS magic!) ---
      tree-sitter-grammars.tree-sitter-nix
      tree-sitter-grammars.tree-sitter-json
      tree-sitter-grammars.tree-sitter-lua
      tree-sitter-grammars.tree-sitter-bash
      tree-sitter-grammars.tree-sitter-python
      tree-sitter-grammars.tree-sitter-markdown

      # --- Utility tools used by LazyVim ---
      ripgrep # telescope live_grep
      fd # telescope file search
      lazygit # LazyGit UI
      wl-clipboard # Wayland clipboard
      fzf # fuzzy finder integration
      trash-cli # safe deleting
      unzip # required by LazyVim for plugin updates
    ];

    # ----------------------------------------------------------
    # Neovim runtime config
    # ----------------------------------------------------------

    extraConfig = ''
      set clipboard+=unnamedplus

      lua << EOF
        -- Disable runtime Treesitter compilation on NixOS
      EOF
    '';
  };

  # Manage ~/.config/nvim declaratively via home-manager
  xdg.configFile = {

    # --- Core init ---
    "nvim/init.lua".text = /* lua */ ''
      require("config.options")
      require("config.keymaps")
      require("config.autocmds")
      require("config.lazy")
    '';

    # --- Lazy bootstrap + LazyVim setup ---
    "nvim/lua/config/lazy.lua".text = /* lua */ ''
      local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
      if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
          "git", "clone",
          "--filter=blob:none",
          "https://github.com/folke/lazy.nvim.git",
          "--branch=stable",
          lazypath,
        })
      end
      vim.opt.rtp:prepend(lazypath)

      require("lazy").setup({
        spec = {
          -- Import LazyVim and its default plugins
          { "LazyVim/LazyVim", import = "lazyvim.plugins" },
          -- Your custom plugins/overrides
          { import = "plugins" },
        },
        defaults = { lazy = true },

        rocks = { enabled = false, hererocks = false, },
        install = { colorscheme = { "catppuccin", "tokyonight", "habamax" } },
        checker = { enabled = true },  -- auto-check for plugin updates
        performance = {
          rtp = {
            disabled_plugins = {
              "gzip", "tarPlugin", "tohtml",
              "tutor", "zipPlugin",
            },
          },
        },
      })
    '';

    # --- Options ---
    "nvim/lua/config/options.lua".text = /* lua */ ''
      vim.g.mapleader = " "
      vim.g.maplocalleader = "\\"

      local opt = vim.opt
      opt.number = true
      opt.relativenumber = true
      opt.signcolumn = "yes"
      opt.cursorline = true
      opt.scrolloff = 8
      opt.wrap = false
      opt.expandtab = true
      opt.shiftwidth = 2
      opt.tabstop = 2
      opt.termguicolors = true
      opt.splitbelow = true
      opt.splitright = true
      opt.undofile = true
      opt.ignorecase = true
      opt.smartcase = true
      opt.clipboard = "unnamedplus"
    '';

    # --- Keymaps ---
    "nvim/lua/config/keymaps.lua".text = /* lua */ ''
      local map = vim.keymap.set

      -- Better window navigation
      map("n", "<C-h>", "<C-w>h")
      map("n", "<C-j>", "<C-w>j")
      map("n", "<C-k>", "<C-w>k")
      map("n", "<C-l>", "<C-w>l")

      -- Move lines up/down in visual mode
      map("v", "J", ":m '>+1<CR>gv=gv")
      map("v", "K", ":m '<-2<CR>gv=gv")

      -- Keep cursor centered when jumping
      map("n", "<C-d>", "<C-d>zz")
      map("n", "<C-u>", "<C-u>zz")

      -- Clear search highlight
      map("n", "<Esc>", "<cmd>noh<cr>")

      -- Lazygit
      map("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })
    '';

    # --- Autocmds ---
    "nvim/lua/config/autocmds.lua".text = /* lua */ ''
      -- Highlight on yank
      vim.api.nvim_create_autocmd("TextYankPost", {
        callback = function()
          vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
        end,
      })

      -- Remove trailing whitespace on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        command = "%s/\\s\\+$//e",
      })
    '';

    # --- Disable Mason (nix provides LSPs instead) ---
    "nvim/lua/plugins/mason.lua".text = /* lua */ ''
      return {
        { "williamboman/mason.nvim",                    enabled = false },
        { "williamboman/mason-lspconfig.nvim",          enabled = false },
        { "WhoIsSethDaniel/mason-tool-installer.nvim",  enabled = false },
      }
    '';

    # --- LSP (nix-provided binaries, no Mason) ---
    "nvim/lua/plugins/lsp.lua".text = /* lua */ ''
      return {
        {
          "neovim/nvim-lspconfig",
          opts = {
            servers = {
              lua_ls    = {},
              nil_ls    = {},   -- Nix
              ts_ls     = {},   -- TypeScript/JavaScript
              pyright   = {},   -- Python
              html      = {},
              cssls     = {},
              jsonls    = {},
            },
          },
        },
      }
    '';

    # --- Neo-tree tweaks ---
    "nvim/lua/plugins/neo-tree.lua".text = /* lua */ ''
      return {
        {
          "nvim-neo-tree/neo-tree.nvim",
          opts = {
            window = { width = 30 },
            filesystem = {
              filtered_items = {
                hide_dotfiles   = false,
                hide_gitignored = false,
              },
            },
          },
        },
      }
    '';

    # --- Colorscheme: Catppuccin Mocha ---
    "nvim/lua/plugins/colorscheme.lua".text = /* lua */ ''
      return {
        {
          "catppuccin/nvim",
          name     = "catppuccin",
          priority = 1000,
          opts     = { flavour = "mocha" },
        },
        {
          "LazyVim/LazyVim",
          opts = { colorscheme = "catppuccin" },
        },
      }
    '';

  };
}
