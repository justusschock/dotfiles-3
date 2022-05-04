-- vim.cmd [[packadd packer.nvim]]
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  execute 'packadd packer.nvim'
end

-- vim.api.nvim_create_autocmd("BufWritePost", {
--   pattern = "plugins.lua",
--   command = "source <afile> | PackerCompile",
-- })

require('packer').init({display = {auto_clean = false}})

return require('packer').startup({function(use)

  -- Load lua path
  local lua_path = function(name)
    return string.format("require'plugins.%s'", name)
  end

  -- Packer can manage itself as an optional plugin
  use { 'wbthomason/packer.nvim' }

  -- LSP
  use { 'neovim/nvim-lspconfig' }
  use { 'onsails/lspkind-nvim' }
  use { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' }
  use { 'kosayoda/nvim-lightbulb', config=lua_path"lightbulb" }
  use { 'jose-elias-alvarez/null-ls.nvim', config = lua_path'null-ls' }
  use {
    "ThePrimeagen/refactoring.nvim",
    requires = {
        {"nvim-lua/plenary.nvim"},
        {"nvim-treesitter/nvim-treesitter"}
    }
  }
  -- Autocomplete
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      { "kdheepak/cmp-latex-symbols" },
    },
    sources = {
      { name = "latex_symbols" },
    },
  })
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-vsnip' }
  use { 'hrsh7th/vim-vsnip' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-calc' }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'ray-x/cmp-treesitter' }
  use { 'lukas-reineke/cmp-rg' }
  use {'romgrk/fzy-lua-native', run = 'make'}
  use {'tzachar/fuzzy.nvim', requires = {'romgrk/fzy-lua-native'}}
  use { 'tzachar/cmp-fuzzy-buffer' }
  use { 'tzachar/cmp-fuzzy-path' }
  use { 'quangnguyen30192/cmp-nvim-tags' }
  use { 'rafamadriz/friendly-snippets' }
  use { 'AndrewRadev/tagalong.vim' }
  use { 'andymass/vim-matchup' }
  

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = lua_path"treesitter" }
  use { 'p00f/nvim-ts-rainbow', config = lua_path"nvim-ts-rainbow" }
  use { 'lukas-reineke/indent-blankline.nvim', config = lua_path"indent-blankline" }
  use { 'JoosepAlviste/nvim-ts-context-commentstring' }
  use { 'romgrk/nvim-treesitter-context' }
  use { 'SmiteshP/nvim-gps', config = lua_path"nvim-gps" }

  -- Syntax
  use { 'editorconfig/editorconfig-vim', config = lua_path"editorconfig" }
  use { 'chrisbra/csv.vim' }
  use { 'junegunn/vim-easy-align' }
  use { 'mhartington/formatter.nvim', config = lua_path"formatter" }
  use { 'zdharma-continuum/zinit-vim-syntax' }

  -- Icons
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'ryanoasis/vim-devicons' }

  -- Status Line and Bufferline
  use { 'famiu/feline.nvim', config = lua_path"feline" }
  use { 'romgrk/barbar.nvim' }

  -- Telescope
  use { 'nvim-lua/popup.nvim' }
  use { 'nvim-lua/plenary.nvim' }
  use { 'nvim-telescope/telescope.nvim', config = lua_path"telescope" }
  use { 'justusschock/telescope-conda.nvim' }
  use { 'nvim-telescope/telescope-fzy-native.nvim' , run = 'make'}
  use { 'nvim-telescope/telescope-project.nvim' }
  use { 'nvim-telescope/telescope-dap.nvim' }
  use { 'pwntester/octo.nvim', config = lua_path"octo" }
  use {
    "nvim-telescope/telescope-arecibo.nvim",
    rocks = {"openssl", "lua-http-parser"}
  }

  -- Explorer
  use { 'kyazdani42/nvim-tree.lua', config = lua_path"nvimtree" }

  -- Color
  use { 'crivotz/nvim-colorizer.lua', config = lua_path"colorizer" }
  use { 'lpinilla/vim-codepainter' }

  -- Git
  use { 'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}, config = lua_path"gitsigns" }
  use { 'kdheepak/lazygit.nvim' }
  use { 'rhysd/committia.vim' }
  use {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      vim.cmd "highlight default link gitblame SpecialComment"
      vim.g.gitblame_enabled = 0
    end,
  }

  -- Registers & clipboard
  use { 'tversteeg/registers.nvim' }
  use { 'AckslD/nvim-neoclip.lua', config = lua_path"nvim-neoclip" }

  -- Move & Search & replace
  use { 'nacro90/numb.nvim', config = lua_path"numb" }
  use { 'ggandor/lightspeed.nvim', config = lua_path"lightspeed" }
  use { 'ThePrimeagen/harpoon', config = lua_path"harpoon" }
  use { 'karb94/neoscroll.nvim', config = lua_path"neoscroll" }
  use { 'dstein64/nvim-scrollview' }
  use { 'chaoren/vim-wordmotion' }
  use { 'fedepujol/move.nvim' }

  -- Tim Pope docet
  use { 'tpope/vim-abolish' }
  use { 'tpope/vim-surround' }
  use { 'tpope/vim-capslock' }
  use { 'tpope/vim-repeat' }
  use { 'tpope/vim-endwise' }
  use { 'tpope/vim-dispatch' }
  use { 'tpope/vim-dadbod' }
  use { 'tpope/vim-jdaddy' }
  use { 'tpope/vim-fugitive' }
  use { 'tpope/vim-commentary' }
  use { 'github/copilot.vim', config = lua_path"copilot" }

  -- Tmux
  use { 'christoomey/vim-tmux-navigator' }

  -- Colorschema
  use { 'sainnhe/gruvbox-material' }

  -- Tags
  use { 'ludovicchabant/vim-gutentags', config = lua_path"vim-gutentags" }

  -- Debugger
  use { 'mfussenegger/nvim-dap', config = lua_path"nvim-dap" }
  use { 'rcarriga/nvim-dap-ui', config = lua_path"nvim-dap-ui" }
  use { 'theHamsta/nvim-dap-virtual-text', config = lua_path"nvim-dap-virtual-text" }
  use { 'mfussenegger/nvim-dap-python' }
  use { "rcarriga/vim-ultest",
    requires = { "vim-test/vim-test" },
    run = ":UpdateRemotePlugins",
    config=lua_path'ultest'
  }

  -- General Plugins
  use { 'rcarriga/nvim-notify', config = lua_path"nvim-notify" }
  use { 'airblade/vim-rooter', config = lua_path"vim-rooter" }
  -- use { 'mhinz/vim-startify' }
  use { 'goolord/alpha-nvim', config = lua_path"alpha-nvim" }
  use { 'jeffkreeftmeijer/vim-numbertoggle' }
  use { 'lambdalisue/suda.vim' }
  use { 'wfxr/minimap.vim', config = lua_path"minimap" }
  use { 'folke/todo-comments.nvim', config = lua_path"todo-comments" }
  use { 'luukvbaal/stabilize.nvim', config = lua_path"stabilize" }
  use { 'beauwilliams/focus.nvim', config = lua_path"focus" }
  use { 'folke/trouble.nvim' }
  use { 'kevinhwang91/nvim-bqf' }
  use { 'lervag/vimtex' }
  use { "folke/which-key.nvim" }
  use { "cespare/vim-toml" }
  use {"akinsho/toggleterm.nvim", config = lua_path'toggleterm'}

  use {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  use {
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

end,
config = {
  max_jobs = 10,
},
  
})
