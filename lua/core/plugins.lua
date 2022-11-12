-- BootStrap
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    vim.notify("正在安装 Packer.nvim，请稍后...")
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]

    -- https://github.com/wbthomason/packer.nvim/issues/750
    local rtp_addition = vim.fn.stdpath("data") .. "/site/pack/*/start/*"
    if not string.find(vim.o.runtimepath, rtp_addition) then
        vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
    end

    vim.notify("Packer.nvim 安装完毕")
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Protected Call
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    vim.notify("未安装 Packer.nvim")
    return
end

-- Startup
packer.startup(
	{
		function(use)

			-- === PLUGINS ===

			-- Packer
			use {'wbthomason/packer.nvim'}
			-- Icons
			use({'kyazdani42/nvim-web-devicons'})
			-- Status line
			use({'nvim-lualine/lualine.nvim'})
			-- use({'vim-airline/vim-airline'})
			-- Utils
			use {'windwp/nvim-autopairs'}
			use {'tpope/vim-surround'}
			use {'phaazon/hop.nvim', branch = 'v2'} -- an easymotion-like plugin
			-- use {'unblevable/quick-scope'}
			-- use {'folke/which-key.nvim'}
			-- Lsp installer
			use {'williamboman/mason.nvim'}
			use {'williamboman/mason-lspconfig.nvim'}
			-- Lspconfig
			use {'neovim/nvim-lspconfig'}
			-- AutoCompletion
			use {'hrsh7th/nvim-cmp'}
			use {'hrsh7th/cmp-nvim-lsp'}
			use {'hrsh7th/cmp-buffer'}
			use {'hrsh7th/cmp-path'}
			use {'hrsh7th/cmp-cmdline'}
			-- Snippets
			use {'L3MON4D3/LuaSnip'}
			use {'saadparwaiz1/cmp_luasnip'}
			use {'onsails/lspkind.nvim'} -- vscode-like icons for nvim-cmp menu 
			use {'rafamadriz/friendly-snippets'} -- vscode-like snippets
			-- Markdown support
			use({'preservim/vim-markdown'})
			use({'iamcco/markdown-preview.nvim',
				run = function() vim.fn['mkdp#util#install']() end,
			})
			-- use({'joker1007/vim-markdown-quote-syntax'}) -- code syntax highlighting
			-- Latex support
			use({'lervag/vimtex'})
			-- Treesitter
			use {
				'nvim-treesitter/nvim-treesitter',
				run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
			}
			-- Firenvim
			use {'glacambre/firenvim', -- embedded neovim in browser
				run = function() vim.fn['firenvim#install'](0) end
			}
			-- Debugger
			use {'mfussenegger/nvim-dap'}
			-- Visual marks
			use {'kshenoy/vim-signature'}
			-- Dashboard
			-- use {''}
			-- Colorscheme
			use {'joshdick/onedark.vim'}
			use {'cormacrelf/vim-colors-github'}
			use {'rafi/awesome-vim-colorschemes'} -- A set of colorschemes


			if packer_bootstrap then
				require('packer').sync()
			end
		end,

		-- Packer configs
		config = {
			-- Maximum concurrency
			max_jobs = 16,
			-- Custom source
			git = {
				-- default_url_format = ""
			},
			-- Floating window
			display = {
				open_fn = function()
					return require("packer.util").float({ border = "single" })
				end
			}
		}
	}
)
