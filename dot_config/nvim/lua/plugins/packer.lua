-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: packer.nvim
-- https://github.com/wbthomason/packer.nvim

-- For information about installed plugins see the README
--- neovim-lua/README.md
--- https://github.com/brainfucksec/neovim-lua#readme

-- Packer Bootstrapping
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Run PackerCompile on plugin changes
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.packer.lua source <afile> | PackerCompile
  augroup end
]])

local cmd = vim.cmd
cmd [[packadd packer.nvim]]

local packer = require 'packer'

-- Add packages
return packer.startup(function()
  use 'wbthomason/packer.nvim' -- packer can manage itself

  -- file explorer
  use {'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {} end}

  -- indent line
  use 'lukas-reineke/indent-blankline.nvim'

--   -- autopair
--   use {
--     'windwp/nvim-autopairs',
--     config = function()
--       require('nvim-autopairs').setup()
--     end
--   }

  -- icons
  use 'kyazdani42/nvim-web-devicons'

  -- tagviewer
  use 'liuchengxu/vista.vim'

  -- treesitter interface
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'nvim-treesitter/nvim-treesitter-refactor'

--   use {
--     "folke/twilight.nvim",
--     config = function()
--       require("twilight").setup {
--         -- your configuration comes here
--         -- or leave it empty to use the default settings
--         -- refer to the configuration section below
--       }
--     end
--   }
  
  use 'mfussenegger/nvim-dap'
  use 'mfussenegger/nvim-dap-python'
  use 'theHamsta/nvim-dap-virtual-text'
  
  -- colorschemes
--   use 'tanvirtin/monokai.nvim'

--   use ({
--     'rose-pine/neovim',
--     as = 'rose-pine',
--     config = function()
--         -- Options (see available options below)
--         vim.g.rose_pine_variant = 'base'

--         -- Load colorscheme after options
--         vim.cmd('colorscheme rose-pine')
--     end
-- })
-- use ({
--     'NLKNguyen/papercolor-theme',
--     config = function()
--           vim.cmd('colorscheme PaperColor')
--     end
-- })
use ({'navarasu/onedark.nvim',
    config = function()
        require('onedark').setup()
    end
})
-- use ({ "briones-gabriel/darcula-solid.nvim", 
--         requires = "rktjmp/lush.nvim" , 
--         config = function()
--             vim.cmd 'colorscheme darcula-solid'
--         end
--     })


  -- LSP
  use 'neovim/nvim-lspconfig'

  -- autocomplete
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',
    },
  }

  -- statusline
  use {
    'famiu/feline.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

  -- git labels
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup()
    end
  }

  -- dashboard
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.opts)
    end
  }


  -- delete buffers
  use {'ojroques/nvim-bufdel'}
--   use "Pocco81/AutoSave.nvim"
  use "907th/vim-auto-save"

--   use 'mhartington/formatter.nvim' -- use separate plugins instead
  -- TODO: Use separate isort package. Autoimport ist already part of pyright
  use 'averms/black-nvim'
  use 'stsewd/isort.nvim'

--   use 'dense-analysis/ale'

use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}

use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
use 'simrat39/symbols-outline.nvim'

  -- use {'numirias/semshi'}
  if packer_bootstrap then
    require('packer').sync()
  end
end)