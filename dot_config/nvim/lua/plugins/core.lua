return {
  { "eandrju/cellular-automaton.nvim" }, -- very important!!!!
  { "chrisgrieser/nvim-chainsaw" },
  {
    "catppuccin/nvim",
    enabled = true,
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    opts = {
      transparent_background = true,
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
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
      },
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
      -- stylua: ignore end
    },
  },
  -- { "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
  },
  {
    "williamboman/mason-lspconfig",
    event = "VeryLazy",
  },
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    opts = {
      servers = {
        stylelint_lsp = {},
      },
      setup = {
        stylelint_lsp = function(_, opts)
          require("lspconfig").stylelint_lsp.setup({
            opts,
            filetypes = { "css", "scss", "less", "sass" },
            settings = {
              stylelintplus = {
                filetypes = { "css", "scss", "less", "sass" },
                validateOnType = true,
              },
            },
          })
          return true
        end,
      },
    },
  },
  -- { "hrsh7th/cmp-nvim-lsp" },
  -- { "hrsh7th/nvim-cmp" },
  -- { "L3MON4D3/LuaSnip" },
  { "tpope/vim-fugitive", event = "VeryLazy" },
  {
    "topaxi/gh-actions.nvim",
    event = "VeryLazy",
    cmd = "GhActions",
    keys = {
      { "<leader>gh", "<cmd>GhActions<cr>", desc = "Open Github Actions" },
    },
    -- optional, you can also install and use `yq` instead.
    build = "make",
    dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
    opts = {},
    config = function(_, opts)
      require("gh-actions").setup(opts)
    end,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },
  -- { "miversen33/netman.nvim", event = "VeryLazy" },
  {
    "m4xshen/hardtime.nvim",
    event = "UIEnter",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {
      disable_mouse = false,
      max_count = 5,
      disabled_keys = {
        ["j"] = {},
        ["k"] = {},
      },
      restricted_keys = {
        ["j"] = {},
        ["k"] = {},
      },
      hints = {
        ["[dcyvV][ia][%(%)]"] = {
          message = function(keys)
            return "Use " .. keys:sub(1, 2) .. "b instead of " .. keys
          end,
          length = 3,
        },
        [":w<cr>"] = {
          message = function(keys)
            return "Use <C-s> insetad of " .. keys
          end,
          length = 3,
        },
      },
    },
  },
  {
    "stevearc/overseer.nvim",
    lazy = true,
    opts = {},
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
      question_header = "  xsu1010 ",
    },
  },
  { "chrisgrieser/nvim-spider" },
  { "tris203/precognition.nvim", config = {} },
  { "mrjones2014/smart-splits.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-macchiato",
    },
  },
}
