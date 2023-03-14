local map = require("utils").map
local builtin = require('telescope.builtin')
local neogit = require('neogit')
local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")

vim.g.mapleader = " "

vim.keymap.set('n', '<leader>ha', harpoon_mark.add_file, {})
vim.keymap.set('n', '<leader>hh', harpoon_ui.toggle_quick_menu, {})

vim.keymap.set('n', '<leader>1', function() harpoon_ui.nav_file(1) end, {})
vim.keymap.set('n', '<leader>2', function() harpoon_ui.nav_file(2) end, {})
vim.keymap.set('n', '<leader>3', function() harpoon_ui.nav_file(3) end, {})

-- buffers
vim.keymap.set('n', '<leader>`', "<C-6>", {}) -- toggle buffer
vim.keymap.set('n', '<leader>bk', "<cmd>bd<cr>", {})
vim.keymap.set('n', '<leader>bb', builtin.buffers, {})
vim.keymap.set('n', ';', builtin.buffers, {})

-- vim.keymap.set('n', '<leader>fr', builtin.oldfiles, {})
vim.keymap.set("n", "<leader>pr", "<cmd>lua require('telescope').extensions.frecency.frecency({ workspace = 'CWD' })<CR>", {noremap = true, silent = true})
-- vim.keymap.set("n", "<leader>fr", "<cmd>lua require('telescope').extensions.frecency.frecency({ previewer = false })<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>ss", "<cmd>Telescope current_buffer_fuzzy_find fuzzy=false case_mode=ignore_case previewer=true<CR>")
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope frecency theme=dropdown previewer=false <CR>", {noremap = true, silent = true})

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader><leader>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>*', builtin.grep_string, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>ht', builtin.colorscheme, {})
vim.keymap.set('n', '<leader>cr', builtin.command_history, {})
vim.keymap.set('n', '<leader>si', builtin.lsp_document_symbols, {})

-- void buffers
vim.keymap.set('n', '<C-d>', '"kd', {})
vim.keymap.set('v', '<C-d>', '"kd', {})
vim.keymap.set("n", '<C-g>', "<cmd>nohl<cr>")

map("n", "<leader>vd", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "<leader>vi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
map("n", "<leader>vsh", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
map("n", "<leader>vrr", "<cmd>lua vim.lsp.buf.references()<CR>")
map("n", "<leader>vrn", "<cmd>lua vim.lsp.buf.rename()<CR>")
map("n", "<leader>vh", "<cmd>lua vim.lsp.buf.hover()<CR>") -- deze goed!
map("n", "<leader>vca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
map("n", "<leader>vsd", "<cmd>lua vim.diagnostic.open_float({scope='line'})<CR>")
map("n", "<leader>vn", "<cmd>lua vim.diagnostic.goto_next()<CR>")
map("n", "<leader>vp", "<cmd>lua vim.diagnostic.goto_prev()<CR>")

vim.keymap.set("n", "<leader>gg", function() neogit.open({ kind="vsplit"}) end, {})

-- map('n', '<leader>a', ':vsplit |lua vim.lsp.buf.definition()<CR>')
-- map('n', '<leader>v', ':vsplit | lua vim.lsp.buf.definition()<CR>')
-- map('n', '<leader>s', ':belowright split | lua vim.lsp.buf.definition()<CR>')
map('n', 'go', '<cmd>lua require"telescope.builtin".lsp_definitions({jump_type="vsplit"})<cr>', {noremap=true, silent=true})
vim.keymap.set("n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<cr>", {noremap=true})
vim.keymap.set("n", "gP", "<cmd>lua require('goto-preview').close_all_win()<cr>", {noremap=true})

vim.keymap.set("n", "<f2>", "<cmd>w<cr>", {noremap=true})

local tmux_run_make = function()
    vim.api.nvim_command('write')
    -- (format "tmux send-keys -t %s:%s.%s '%s' Enter" tmux-session-name tmux-window-name tmux-pane-name command)))
    vim.fn.jobstart(
        "tmux send-keys -t dev:1.1 'make run' Enter", 
        {
            cwd = vim.fn.getcwd()
        }
    )
end

vim.keymap.set("n", "<f5>", tmux_run_make, {})

