-- auto install packer if not installed

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed
local packer_
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])
 
-- import packer safely
local status, packer = pcall(require, "packer")
packer = pcall(require, "packer")
if not status then
  return end
-- ^^^ installs packer if not installed when starting neovim

local status, packer = pcall(require, "packer")
if not status then 
    return
end 

-- add/install packages here
return packer.startup(function(use)
    use("wbthomason/packer.nvim") -- main packer package

    -- lua functions that many plugins use
    use('nvim-lua/plenary.nvim')
    use('bluz71/vim-nightfly-colors') -- colorscheme
    use 'jaredgorski/spacecamp'
    use 'EdenEast/nightfox.nvim'
    use 'bluz71/vim-moonfly-colors'
    use 'arcticicestudio/nord-vim'
    use 'owickstrom/vim-colors-paramount'
    use 'drewtempelmeyer/palenight.vim'
    use 'tjdevries/gruvbuddy.nvim'
    use 'srcery-colors/srcery-vim'
    use 'ayu-theme/ayu-vim'
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use 'fxn/vim-monochrome'
    use 'Lokaltog/vim-monotone'
    use 'sainnhe/gruvbox-material'
    use 'Dave-Elec/gruvbox'
    use 'joshdick/onedark.vim'
    use 'ghifarit53/tokyonight-vim'
    use 'eddyekofo94/gruvbox-flat.nvim'
    use ({'echasnovski/mini.nvim', branch = 'stable' })
    use 'catppuccin/nvim'
    use {'frenzyexists/aquarium-vim',  branch = develop }
    use {'dracula/vim',  as = dracula }


    use('christoomey/vim-tmux-navigator') -- move b/n splits and tmux and nvim windows !! high mobility 
    use("szw/vim-maximizer") -- maximizes and restores current window

    -- essential plugins
    use("tpope/vim-surround") -- add, delete, change surroundings 
    use("vim-scripts/ReplaceWithRegister") -- replace with register contents using motion (gr + motion)
    -- commenting with gc
    use("numToStr/Comment.nvim")
    -- leap motions, move around like a ninja 
    use("ggandor/leap.nvim")
    -- use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
    use 'deoplete-plugins/deoplete-clang'
    -- file explorer
    use("nvim-tree/nvim-tree.lua")
    -- vs-code like icons
    use("nvim-tree/nvim-web-devicons")
    use("nvim-lualine/lualine.nvim")
    use("glepnir/galaxyline.nvim")
        
    -- fuzzy finding w/ telescope
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
    use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

     -- autocompletion
    use("hrsh7th/nvim-cmp") -- completion plugin
    use("hrsh7th/cmp-buffer") -- source for text in buffer
    use("hrsh7th/cmp-path") -- source for file system paths
    use 'hrsh7th/cmp-cmdline'
    
    -- GDB debugging in vim?
    use 'sakhnik/nvim-gdb' 
    use 'nikvdp/neomux'
    use 'justinmk/vim-syntax-extra'
    use 'vim-jp/vim-cpp'
    use 'tiagofumo/vim-nerdtree-syntax-highlight'
    use 'ryanoasis/vim-devicons'
    use 'tpope/vim-pathogen'
    use 'vim-syntastic/syntastic'
    use 'vim-python/python-syntax'

    use {'neoclide/coc.nvim', branch = 'release'}  
    use 'ms-jpq/coq_nvim'
    use 'ms-jpq/coq.artifacts'
    
    -- spellcheker
    use 'lewis6991/spellsitter.nvim'
    
    -- tabline 
    use 'romgrk/barbar.nvim'

    -- For ultisnips users.
    use("L3MON4D3/LuaSnip") -- snippet engine
    use("saadparwaiz1/cmp_luasnip") -- for autocompletion
    use("rafamadriz/friendly-snippets") -- useful snippets

    -- managing & installing lsp servers, linters & formatters
    use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
    use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig
    
     -- configuring lsp servers
    use("neovim/nvim-lspconfig") -- easily configure language servers
    use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
    use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
    use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
    use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion
    
    -- formatting & linting
    use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
    use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls    
    
    -- copilot 
    use("github/copilot.vim")

    -- neovim coderunner
    use("metakirby5/codi.vim")

    -- show indent lines  
    use "lukas-reineke/indent-blankline.nvim"
    
  -- treesitter configuration
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
        local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
        ts_update()
    end,
  })

    -- auto closing
    use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
    use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

  -- git integration
    use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side
    
    
    -- fterm for terminal 
    use "numToStr/FTerm.nvim"
    if packer_bootstrap then
        require("packer").sync()
    end
end)

