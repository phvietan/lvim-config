-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
vim.opt.clipboard = 'unnamedplus'
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.opt.mouse = 'a'


vim.filetype.add({
    extension = {
        ejs = "html",
    },
})

lvim.plugins = {
  {"akinsho/toggleterm.nvim", version = '*', config = function()
  require("toggleterm").setup({
      size = 20,
    })
end},
}

local function open_nvim_tree()
  require("nvim-tree.api").tree.open()
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

function ForceKillBuffer()
  local kill_cmd = "bd"
  local force = true
  require("lvim.core.bufferline").buf_kill(kill_cmd, 0, force)
end

lvim.keys.normal_mode["<C-w>"] = ":lua ForceKillBuffer()<cr>"
lvim.keys.normal_mode["<Tab>"] = ":bnext<cr>"
lvim.keys.normal_mode["<S-Tab>"] = ":bprev<cr>"
lvim.keys.normal_mode["|"] = ":vsplit<CR>"
lvim.keys.normal_mode["-"] = ":hsplit<CR>"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

lvim.builtin.terminal.execs = {
  { vim.o.shell, "<leader>`", "Horizontal Terminal", "horizontal", 0.4 },
  { vim.o.shell, "<C-`>", "Horizontal Terminal", "horizontal", 0.4 },
}
