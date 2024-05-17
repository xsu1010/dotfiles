return {
  {
    "catppuccin/nvim",
    enabled = true,
    lazy = true,
    name = "catppuccin",
    priority = 1000,
    opts = {
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    enabled = true,
    event = "LazyFile",
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

      -- stylua: ignore start
      map("n", "]h", gs.next_hunk, "Next Hunk")
      map("n", "[h", gs.prev_hunk, "Prev Hunk")
      map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
      map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
      map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
      map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
      map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
      map("n", "<leader>ghp", gs.preview_hunk_inline, "Preview Hunk Inline")
      map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
      map("n", "<leader>ghd", gs.diffthis, "Diff This")
      map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
      end,
    },
  },
  -- { "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
  {
    "williamboman/mason.nvim",
  },
  {
    "williamboman/mason-lspconfig",
  },
  {
    "neovim/nvim-lspconfig",
    --  opts = {
    --    setup = {
    --      grammarly = function(_, opts)
    --        require("lspconfig").grammarly.setup({
    --          server = opts,

    --          cmd = { os.getenv("HOME") .. "/bin/grammarlywo.sh" },
    --          settings = {
    --            grammarly = {
    --              config = {
    --                suggestionCategories = {
    --                  informalPronounsAcademic = "on",
    --                },
    --              },
    --            },
    --          },
    --        })
    --      end,
    --    },
    --  },
  },
  -- { "hrsh7th/cmp-nvim-lsp" },
  -- { "hrsh7th/nvim-cmp" },
  -- { "L3MON4D3/LuaSnip" },
  { "andweeb/presence.nvim" },
  {
    "https://codeberg.org/esensar/nvim-dev-container",
    opts = {
      setup = {
        devcontainer = function(_)
          require("devcontainer").setup({
            attach_mounts = {
              neovim_config = {
                enabled = true,
                options = { "readOnly" },
              },
              neovim_data = {
                enabled = false,
                options = {},
              },
              neovim_state = {
                enabled = false,
                options = {},
              },
            },
          })
        end,
      },
    },
  },
  { "jamestthompson3/nvim-remote-containers" },
  { "tpope/vim-fugitive" },
  { "nosduco/remote-sshfs.nvim" },
  {
    "chipsenkbeil/distant.nvim",
    branch = "v0.3",
    config = function()
      require("distant"):setup()
    end,
  },
  -- {
  --   "nvim-telescope/telescope-file-browser.nvim",
  --   dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  -- },
  { "miversen33/netman.nvim" },
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "marilari88/neotest-vitest",
    },
    opts = {
      adapters = {
        ["neotest-vitest"] = {},
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-macchiato",
    },
  },
}
