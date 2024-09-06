require('lazy').setup({
  'sainnhe/everforest',
  'itchyny/lightline.vim',
  'nvim-tree/nvim-web-devicons',
  'tpope/vim-surround',
  'tpope/vim-commentary',
  'tpope/vim-eunuch',
  { 'tpope/vim-fugitive',     dependencies = 'tpope/vim-rhubarb' },
  { 'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim' },
  'aserowy/tmux.nvim',
  { 'nvim-treesitter/nvim-treesitter',  run = ':TSUpdate' },
  {
    "folke/trouble.nvim",
    opts = {
      modes = {
        preview_float = {
          mode = "diagnostics",
          preview = {
            type = "float",
            relative = "editor",
            border = "rounded",
            title = "Preview",
            title_pos = "center",
            position = { 0, -2 },
            size = { width = 0.3, height = 0.3 },
            zindex = 200,
          },
        },
      },
    },
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzy-native.nvim' },
      { 
        "nvim-telescope/telescope-live-grep-args.nvim" ,
        -- This will not install any breaking changes.
        -- For major updates, this must be adjusted manually.
        version = "^1.0.0",
      },
    }
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },
  -- LSP
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
    }
  },
  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      { 'L3MON4D3/LuaSnip' },
      { 'hrsh7th/cmp-buffer' }, -- Optional
      { 'hrsh7th/cmp-path' },   -- Optional
    },
  },

  -- Formatting
  'nvimtools/none-ls.nvim'
});
