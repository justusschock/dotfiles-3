local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
end

local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end
-- vim.api.nvim_command("packadd packer.nvim")
vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use {'wbthomason/packer.nvim', commit='dac4088c70f4337c6c40d1a2751266a324765797'}

  use {'nvim-lua/plenary.nvim', commit='4b7e52044bbb84242158d977a50c4cbcd85070c7'} -- Common utilities

  -- Color Scheme
  use {
    'svrana/neosolarized.nvim', commit='aea6fcffaed89839e57fc6b1f73ab3abded07939',
    requires = { 'tjdevries/colorbuddy.nvim', commit='cdb5b0654d3cafe61d2a845e15b2b4b0e78e752a' }
  }
  use {'norcalli/nvim-colorizer.lua', commit='36c610a9717cc9ec426a07c8e6bf3b3abcb139d6'}
  use {'nvim-lualine/lualine.nvim', commit='32a7382a75a52e8ad05f4cec7eeb8bbfbe80d461'} -- Statusline
  use {'WhoIsSethDaniel/lualine-lsp-progress.nvim', commit='16380c531efad8131ba0f395bdeb97fa2ae169f4'}
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    commit = 'c06baac6a19710d41ca871d5dc030fd986958bfd'
  }
  -- use { 'nvim-treesitter/nvim-treesitter-refactor', commit='75f5895cc662d61eb919da8050b7a0124400d589'}
  use { 'nvim-tree/nvim-web-devicons', commit='05e1072f63f6c194ac6e867b567e6b437d3d4622' } -- File icons

  use {'hrsh7th/cmp-buffer', commit='3022dbc9166796b644a841a02de8dd1cc1d311fa'} -- nvim-cmp source for buffer words
  use {'hrsh7th/cmp-nvim-lsp', commit='59224771f91b86d1de12570b4070fe4ad7cd1eeb'} -- nvim-cmp source for neovim's built-in LSP
  use {'hrsh7th/nvim-cmp', commit='e55033fce468c9c578b946948807f2ac48a6ee08'} -- Completion
  use {'hrsh7th/cmp-path', commit='91ff86cd9c29299a64f968ebb45846c485725f23'}
  use {'hrsh7th/cmp-cmdline', commit='23c51b2a3c00f6abc4e922dbd7c3b9aca6992063'}
  use {'hrsh7th/cmp-nvim-lsp-signature-help', commit='d2768cb1b83de649d57d967085fe73c5e01f8fd7'}
  use { 'ray-x/cmp-treesitter', commit='b40178b780d547bcf131c684bc5fd41af17d05f2' }
  use { 'quangnguyen30192/cmp-nvim-tags', commit='de630ce773d249ab5739405a3428a5a29d7e0076' }
  use {'hrsh7th/nvim-pasta', commit = 'c0717c23493742bac7e07bde342585478f05537a'} -- TODO: give this a try and compare with/without

  -- LSP
  use {'onsails/lspkind-nvim', commit='c68b3a003483cf382428a43035079f78474cd11e'} -- vscode-like pictograms
  use {'neovim/nvim-lspconfig', commit='7d0ce54a4cf6e844d87e49d1576c0fffb6d27a6e'} -- LSP
  use {'jose-elias-alvarez/null-ls.nvim', commit='647a1eeeefc43ce15d941972642210637c370471'} -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use {'MunifTanjim/prettier.nvim', commit='918b99f5ddd7a56395fd393767ab6a3c15a50789'} -- Prettier plugin for Neovim's built-in LSP client
  use {'williamboman/mason.nvim', commit='fc090f84f525143d47004cae948315fa4b27ab4f'}
  use {'williamboman/mason-lspconfig.nvim', commit='698713735933a5891080fc3d87a687f90b9d2aee'}
  use {'glepnir/lspsaga.nvim', commit='b7b4777369b441341b2dcd45c738ea4167c11c9e'} -- LSP UIs
  use {'L3MON4D3/LuaSnip', commit='5570fd797eae0790affb54ea669a150cad76db5d'}
  
  -- Multi-Cursor Support
  use {'mg979/vim-visual-multi', commit='724bd53adfbaf32e129b001658b45d4c5c29ca1a'}

  -- Comments
  use { 'tpope/vim-commentary', commit='e87cd90dc09c2a203e13af9704bd0ef79303d755' }

  -- KeyMappings
  -- TODO: Whichkey bindings
  use { "folke/which-key.nvim", commit='8682d3003595017cd8ffb4c860a07576647cc6f8' }
  use { 'kevinhwang91/nvim-bqf', commit='b418b0a241d36509196944a6f6bee886c775d54f', ft='qf' }
  use { 'folke/trouble.nvim', commit='897542f90050c3230856bc6e45de58b94c700bbf' }


  -- Toggle Terminal
  use {'akinsho/toggleterm.nvim', commit='b02a1674bd0010d7982b056fd3df4f717ff8a57a'}

  -- File Search
  use {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
  }
  use { 'nvim-lua/popup.nvim', commit='b7404d35d5d3548a82149238289fa71f7f6de4ac'}
  
  use {'justusschock/telescope-conda.nvim', commit='2e8176b811bdf75260d06a475362ff818ace9299'}
  use {'nvim-telescope/telescope-file-browser.nvim', commit='eb4f026735f781ea5749331a5059021328d6eee8'}

  use {'folke/zen-mode.nvim', commit='6f5702db4fd4a4c9a212f8de3b7b982f3d93b03c'}

  use {
    "iamcco/markdown-preview.nvim", commit='02cc3874738bc0f86e4b91f09b8a0ac88aef8e96',
    run = function() vim.fn["mkdp#util#install"]() end,
  }
  use {'akinsho/nvim-bufferline.lua', commit='4ecfa81e470a589e74adcde3d5bb1727dd407363'}

  -- Git
  -- use 'github/copilot.vim'
  use {'lewis6991/gitsigns.nvim', commit = '2ab3bdf0a40bab53033048c6be75bda86316b55d'}
  use {'f-person/git-blame.nvim', commit='d3afb1c57918720548effb42edec530232436378'} -- For git blame & browse

  use {'jghauser/mkdir.nvim', commit='c55d1dee4f099528a1853b28bb28caa802eba217'}
  use {'folke/todo-comments.nvim', commit='c1760010f46992165995aaa52ca967f473a2e8e6'}
  use { 'rcarriga/nvim-notify', commit='b005821516f1f37801a73067afd1cef2dbc4dfe8'}
  use { 'airblade/vim-rooter', commit='0415be8b5989e56f6c9e382a04906b7f719cfb38' }
  use { 'lewis6991/impatient.nvim', commit='d3dd30ff0b811756e735eb9020609fa315bfbbcc'}

  use { 'ludovicchabant/vim-gutentags', commit='1337b1891b9d98d6f4881982f27aa22b02c80084' }
  use {
    "luukvbaal/stabilize.nvim",
    config = function() require("stabilize").setup() end, 
    commit='34069870a8e72632c5447188e638e1c6bfebc353'
  }
  use { 'jeffkreeftmeijer/vim-numbertoggle', commit='075b7478777e694fbac330ee34a74590dad0fee1'}
  use {
    "folke/twilight.nvim",
    commit='1ffa6a4d89fb2fbb784c6674044bf54f1fca936f',
    config = function()
      require("twilight").setup {
      }
    end
  }

  use {'nvim-neo-tree/neo-tree.nvim', commit='3b41f0d17139bb156f1acd907608f63e0e307caf',
    module = "neo-tree",
    cmd = "Neotree",
    requires = { {"MunifTanjim/nui.nvim", commit='4939282919885e1c83aff68ecb35b3cadf6015a9'}, },
    setup = function()
      vim.g.neo_tree_remove_legacy_commands = true
    end,
  }
  -- TODO: python testing
  -- TODO: alpha nvim
  -- TODO: github copilot
  -- TODO: telescope extesions (including conda)

  -- use { 'beauwilliams/focus.nvim', commit='3d9df42aa4f9b572348418207b752f81adea09a5'} -- TODO check differences

  

  -- TODO: check following plugins:
  -- use { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' }
  -- use { 'kosayoda/nvim-lightbulb', config=lua_path"lightbulb" }
  -- use {
  --   "ThePrimeagen/refactoring.nvim",
  --   requires = {
  --       {"nvim-lua/plenary.nvim"},
  --       {"nvim-treesitter/nvim-treesitter"}
  --   }
  -- }
  -- use { 'lukas-reineke/cmp-rg' }
  -- use {'romgrk/fzy-lua-native', run = 'make'}
  -- use {'tzachar/fuzzy.nvim', requires = {'romgrk/fzy-lua-native'}}
  -- use { 'tzachar/cmp-fuzzy-buffer' }
  -- use { 'tzachar/cmp-fuzzy-path' }
  -- use { 'quangnguyen30192/cmp-nvim-tags' }
  -- use { 'AndrewRadev/tagalong.vim' }
  -- use { 'andymass/vim-matchup' }
  -- use { 'p00f/nvim-ts-rainbow', config = lua_path"nvim-ts-rainbow" }
  -- use { 'lukas-reineke/indent-blankline.nvim', config = lua_path"indent-blankline" }
  -- use { 'tpope/vim-jdaddy' }
  -- use { 'tpope/vim-fugitive' }
  -- use { 'github/copilot.vim', config = lua_path"copilot" }
  -- use { 'christoomey/vim-tmux-navigator' }
  -- use { 'mfussenegger/nvim-dap', config = lua_path"nvim-dap" }
  -- use { 'rcarriga/nvim-dap-ui', config = lua_path"nvim-dap-ui" }
  -- use { 'theHamsta/nvim-dap-virtual-text', config = lua_path"nvim-dap-virtual-text" }
  -- use { 'mfussenegger/nvim-dap-python' }
  -- use { "rcarriga/vim-ultest",
  --   requires = { "vim-test/vim-test" },
  --   run = ":UpdateRemotePlugins",
  --   config=lua_path'ultest'
  -- }

  -- use { 'goolord/alpha-nvim', config = lua_path"alpha-nvim" }
  -- use { 'jeffkreeftmeijer/vim-numbertoggle' }
  -- use { 'wfxr/minimap.vim', config = lua_path"minimap" }
end)