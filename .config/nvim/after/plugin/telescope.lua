local telescope = require("telescope")

local function filenameFirst(_, path)
  local tail = vim.fs.basename(path)
  local parent = vim.fs.dirname(path)
  if parent == "." then return tail end
  return string.format("%s\t\t%s", tail, parent)
end

telescope.setup({
  defaults = {
    layout_strategy = 'vertical',
    path_display = {
      "truncate"
    },
    -- not yet available API
    -- path_display = {
    --   "truncate",
    --   filename_first = {
    --     reverse_directories = true
    --   },
    -- },
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
vim.keymap.set('n', '<leader>fid', function ()
  local netrw_dir = vim.b.netrw_curdir or vim.fn.getcwd()
  require('telescope.builtin').live_grep({ search_dirs = { netrw_dir } })
end, { desc = "Live grep in Netrw dir" })
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

-- function M.buffers(opts)
--   opts = opts or {}
--   opts.previewer = false
--   -- opts.sort_lastused = true
--   -- opts.show_all_buffers = true
--   -- opts.shorten_path = false
--   opts.attach_mappings = function(prompt_bufnr, map)
--     local delete_buf = function()
--       local current_picker = action_state.get_current_picker(prompt_bufnr)
--       local multi_selections = current_picker:get_multi_selection()

--       if next(multi_selections) == nil then
--         local selection = action_state.get_selected_entry()
--         actions.close(prompt_bufnr)
--         vim.api.nvim_buf_delete(selection.bufnr, {force = true})
--       else
--         actions.close(prompt_bufnr)
--         for _, selection in ipairs(multi_selections) do
--           vim.api.nvim_buf_delete(selection.bufnr, {force = true})
--         end
--       end

--     map('i', '<C-x>', delete_buf)
--     return true
--   end
--   require('telescope.builtin').buffers(require('telescope.themes').get_dropdown(opts))
-- end
