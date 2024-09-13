local telescope = require("telescope")

telescope.setup({
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
    },
  },
  pickers = {

  },
  extensions = {
    file_browser = {
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = false,
    }
  }
})

telescope.load_extension "fzy_native"
telescope.load_extension "file_browser"
telescope.load_extension "live_grep_args"

local builtin = require('telescope.builtin')
local extensions = telescope.extensions

vim.keymap.set('n', '<leader>rr', builtin.resume)
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>flg', extensions.live_grep_args.live_grep_args, {})
vim.keymap.set('n', '<leader>fsh', builtin.search_history, {})
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>gb', builtin.git_branches)
vim.keymap.set('n', '<leader>gs', builtin.git_status)
vim.keymap.set('n', '<leader>bf', function()
  extensions.file_browser.file_browser({ path = '%:p:h', select_buffer = true })
end)
vim.keymap.set('n', '<leader>fb', function()
  builtin.buffers({ sort_mru = true })
end)
vim.keymap.set('n', '<leader>fh', builtin.help_tags)
vim.keymap.set('n', '<leader>fs', function()
  builtin.grep_string({ search = vim.fn.input("grep > ") })
end)
