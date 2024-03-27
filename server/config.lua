-- Forum: https://www.reddit.com/r/lunarvim/

vim.opt.clipboard = 'unnamedplus'
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.opt.mouse = 'a'


lvim.plugins = {
  {"akinsho/toggleterm.nvim", version = '*', config = function()
  require("toggleterm").setup({
      size = 20,
    })
end},

}

function ForceKillBuffer()
  local kill_cmd = "bd"
  local force = true
  require("lvim.core.bufferline").buf_kill(kill_cmd, 0, force)
end

lvim.keys.normal_mode["<leader>x"] = ":lua ForceKillBuffer()<cr>"
lvim.keys.normal_mode["<Tab>"] = ":bnext<cr>"
lvim.keys.normal_mode["<S-Tab>"] = ":bprev<cr>"
lvim.keys.normal_mode["|"] = ":vsplit<CR>"
lvim.keys.normal_mode["-"] = ":split<CR>"
lvim.keys.normal_mode["<C-Right>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<C-Left>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

lvim.builtin.terminal.execs = {
      { vim.o.shell, "<leader>`", "Horizontal Terminal", "horizontal", 0.4 },
      { vim.o.shell, "<C-`>", "Horizontal Terminal", "horizontal", 0.4 },

}

local function open_nvim_tree()
  require("nvim-tree.api").tree.open()
--  require("nvim-tree").setup()
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

