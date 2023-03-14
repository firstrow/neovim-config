vim.cmd [[packadd packer.nvim]]
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap =
    fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end

local packer = require('packer')

packer.init({
    -- log = { level = 'debug' }, 
})

return packer.startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-nvim-lsp", -- nvim-cmp source for neovim builtin LSP client
            "hrsh7th/cmp-nvim-lua", -- nvim-cmp source for nvim lua
            "hrsh7th/cmp-buffer",   -- nvim-cmp source for buffer words.
            "saadparwaiz1/cmp_luasnip" -- luasnip completion source for nvim-cmp
        },
        config = [[ require('plugins/complete') ]]
    }

    use {
        'neovim/nvim-lspconfig',
        config = [[ require('plugins/lsp') ]]
    }

    use {
        -- Nvim Treesitter configurations and abstraction layer
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = [[ require('plugins/treesitter') ]]
    }

    use {
        -- Snippet Engine for Neovim written in Lua.
        "L3MON4D3/LuaSnip",
        requires = {
            "rafamadriz/friendly-snippets" -- Snippets collection for a set of different programming languages for faster development.
        },
        config = [[ require('plugins/snip') ]]
    }

    use {
      "nvim-telescope/telescope-project.nvim"
    }

    use {
      "nvim-telescope/telescope-fzf-native.nvim",
      run = "make"
    }

    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "BurntSushi/ripgrep"
        },
        config = [[ require('plugins/telescope') ]]
    }

    use {
        'rmagatti/goto-preview',
        config = function()
            require('goto-preview').setup {}
        end
    }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    use { 
        'TimUntersberger/neogit', 
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require('neogit').setup {
                disable_commit_confirmation = true,
            }
        end
    }

    use {
        "nvim-telescope/telescope-frecency.nvim",
        config = function()
            require"telescope".load_extension("frecency")
        end,
        requires = {"kkharji/sqlite.lua"}
    }

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use {
        'ThePrimeagen/harpoon',
        requires = {'nvim-lua/plenary.nvim' }
    }

    use 'famiu/bufdelete.nvim'

end)
