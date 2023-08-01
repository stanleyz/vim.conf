return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'preservim/nerdtree'
  use {
    'junegunn/fzf.vim',
    requires = { 'junegunn/fzf', run = ':call fzf#install()' }
  }
  use 'easymotion/vim-easymotion'
  use 'nvim-tree/nvim-tree.lua'

  use 'neovim/nvim-lspconfig'

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin

  use 'tpope/vim-fugitive' -- For Git
  use 'tpope/vim-surround' -- To change surroundings
  use 'jiangmiao/auto-pairs' -- auto pairs
  use 'airblade/vim-gitgutter' -- git status on the left column
  use 'nvim-lualine/lualine.nvim' -- status line
  -- Terraform
  use 'hashivim/vim-terraform'
  use 'juliosueiras/vim-terraform-completion'
end)
