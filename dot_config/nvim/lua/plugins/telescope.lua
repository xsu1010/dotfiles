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

require("telescope").setup({
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
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = { "node_modules" },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "truncate" },
    winblend = 5,
    border = true,
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    use_less = false,
    dynamic_preview_title = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
  },
})
