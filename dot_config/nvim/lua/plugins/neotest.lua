return {
  {
    "nvim-neotest/neotest",
    event = "VeryLazy",
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
      -- on_attach = function(bufnr)
      --   local function map(mode, l, r, opts)
      --     opts = opts or {}
      --     opts.buffer = bufnr
      --     vim.keymap.set(mode, l, r, opts)
      --   end
      -- end,
    },
    keys = {
      {
        "<leader>twt",
        function()
          require("neotest").watch.watch({ vim.fn.expand("%"), vitestCommand = "vitest" })
        end,
        desc = "Run File on Watch Mode",
      },
    },
  },
}
