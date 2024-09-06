vim.g.everforest_background = "hard"
vim.g.everforst_better_performance = 1

vim.g.lightline = {
  colorscheme = "everforest",
  active = {
    left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } }
  },
  component_function = {
    gitbranch = 'FugitiveHead'
  }
}

vim.cmd("colorscheme everforest")
