require('plugins')

local map = vim.api.nvim_set_keymap
local home = os.getenv('HOME')
options = { noremap = true }

vim.g.mapleader=","

map('i', '<leader><leader>', '<Esc>', options)
map('v', '<leader><leader>', '<Esc>', options)
map('c', '<leader><leader>', '<Esc>', options)

map('n', '<leader>q', ':q!<CR>', options)
map('i', '<leader>q', '<Esc>q!<CR>', options)

map('n', '<leader>h', '<C-w>h', options)
map('n', '<leader>j', '<C-w>j', options)
map('n', '<leader>k', '<C-w>k', options)
map('n', '<leader>l', '<C-w>l', options)
map('n', '<leader>re', ':e!<CR>', options)
map('n', '<leader>rg', ':Rg ', options)
map('i', '<leader>l', '<C-w>l', options)
map('i', '<leader>h', '<C-w>h', options)
map('i', '<leader>j', '<C-w>j', options)
map('i', '<leader>k', '<C-w>k', options)
map('i', '<leader>l', '<C-w>l', options)
map('i', '<leader>o', '<Esc>o', options)
map('i', '<leader>O', '<Esc>O', options)
map('i', '<leader>re', '<Esc>:e!<CR>', options)
map('i', '<leader>rg', '<Esc>:Rg ', options)

-- sudo and write
map('c', 'sw', 'w !sudo tee >/dev/null %', options)
-- ctrl-r to search history
map('c', '<C-r>', '<C-f>', options)
-- ctrl-f to forward
map('c', '<C-f>', '<Right>', options)
-- ctrl-b to forward
map('c', '<C-b>', '<Left>', options)

map('n', '<leader>p', ':NvimTreeFindFileToggle!<CR>', options)

map('n', '<leader>f', ':Files<CR>', options)
map('i', '<leader>f', '<Esc>:Files<CR>', options)

map('n', '<leader>gci', ':Git commit -a<CR>', options)
map('n', '<leader>gpb', ':Git push --set-upstream origin ', options)
map('n', '<leader>gps', ':Git push<CR>', options)
map('n', '<leader>gco', ':Git checkout ', options)
map('n', '<leader>gpr', ':Git pull --rebase<CR>', options)
map('n', '<leader>gbl', ':Git blame<CR>', options)
map('n', '<leader>gaa', ':Git add *<CR>', options)
map('n', '<leader>gac', ':Git add %<CR>', options)

-- Set the tabstop, Shiftwidth, and expandtab options
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
-- Auto wrap lines
vim.o.wrap = true
vim.o.textwidth = 80
-- Enable spelling check
vim.o.spell = true

-- disable chaning cursor using mouse
vim.o.mouse = ""

-- ignore case on search
vim.o.smartcase = true
vim.o.ignorecase = true
-- display line number
vim.o.nu = true
vim.g.EasyMotion_verbose = 0

-- undo files
vim.o.undodir = home .. '/.vim/undo'
vim.o.undofile = true

-- config status line
require('lualine').setup({
  options = {
    theme = 'powerline_dark',
    path = 3,
  }
})

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- nvim-tree key bindings
local function nvim_tree_on_attach(bufnr)
  local api = require "nvim-tree.api"
  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end
  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<CR>', api.node.open.no_window_picker, opts('Open in Place'))
  vim.keymap.set('n', 'i', api.node.open.horizontal, opts('Open in horizontal split'))
  vim.keymap.set('n', 's', api.node.open.vertical, opts('Open in vertical split'))
  vim.keymap.set('n', 't', api.node.open.tab, opts('Open in tab'))
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
end
-- empty setup using defaults
require("nvim-tree").setup({
  view = {
    width = 50,
  },
  filters = {
    git_ignored = false,
    dotfiles = true,
  },
  update_focused_file = {
    enable = true, -- Focus on current file
    update_root = true, -- Update root, same to ! with toggle
  },
  actions = {
    open_file = {
      quit_on_open = true, -- Close tree once files opened
      window_picker = {
        enable = false, -- Don't let me choose which pane to use
      },
    },
  },
  on_attach = nvim_tree_on_attach,
})

-- Setup language servers.
local lspconfig = require('lspconfig')
-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'tsserver' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end

lspconfig['ltex'].setup{
  cmd = { 'ltex-ls' },
  filetypes = { 'markdown', 'text' },
}

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
    ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
    -- C-b (back) C-f (forward) for snippet placeholder navigation.
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
