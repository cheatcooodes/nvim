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
			-- Packer
			use 'wbthomason/packer.nvim'

			-- Plugins
			use 'vim-airline/vim-airline'
			use {"windwp/nvim-autopairs",
					config = function() require("nvim-autopairs").setup {} end
			}
			use {
				'phaazon/hop.nvim',
				branch = 'v2', -- optional but strongly recommended
				config = function()
					-- you can configure Hop the way you like here; see :h hop-config
					require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
				end
			}
			
			-- Colorscheme
			use 'joshdick/onedark.vim'
			use 'cormacrelf/vim-colors-github'

			-- Automatically set up your configuration after cloning packer.nvim
			if packer_bootstrap then
				require('packer').sync()
			end
		end,

		config = {
			-- Maximum concurrency
			max_jobs = 16, -- 最大并发数

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




