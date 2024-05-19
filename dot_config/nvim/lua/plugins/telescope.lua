local colors = require("catppuccin.palettes").get_palette()
local TelescopeColor = {
  TelescopeMatching = { fg = colors.mauve },
  TelescopeSelection = { fg = colors.text, bg = colors.surface0, bold = true },

  TelescopePromptPrefix = { bg = colors.surface0 },
  TelescopePromptNormal = { bg = colors.surface0 },
  TelescopeResultsNormal = { bg = colors.base },
  TelescopePreviewNormal = { bg = colors.base },
  TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
  TelescopeResultsBorder = { bg = colors.base, fg = colors.base },
  TelescopePreviewBorder = { bg = colors.base, fg = colors.base },
  TelescopePromptTitle = { bg = colors.mauve, fg = colors.base },
  TelescopeResultsTitle = { fg = colors.base },
  TelescopePreviewTitle = { bg = colors.green, fg = colors.base },
}

for hl, col in pairs(TelescopeColor) do
  vim.api.nvim_set_hl(0, hl, col)
end

return {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {

    defaults = {
      -- layout_strategy = "flex",
      -- layout_config = {
      --   width = 0.9,
      --   height = 0.9,
      --   prompt_position = "top",
      --   anchor = "CENTER",
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
      },
      prompt_prefix = "   ",
      selection_caret = "  ",
      wrap_results = false,
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "ascending",
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
          results_width = 0.8,
          anchor = "CENTER",
        },
        vertical = {
          mirror = false,
        },
        width = 0.87,
        height = 0.80,
        preview_cutoff = 120,
      },
      file_ignore_patterns = { "node_modules" },
      path_display = { "truncate" },
      winblend = 5,
      border = {},
      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      color_devicons = true,
      dynamic_preview_title = true,
    },
  },
}
