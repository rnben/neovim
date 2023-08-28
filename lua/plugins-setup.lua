-- 插件配置
require('go').setup()
require('lualine').setup()
require('gitsigns').setup()
require("nvim-tree").setup()
require("toggleterm").setup()
require("nvim-autopairs").setup()

local wk = require("which-key")
wk.register(mappings, opts)

local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        require('go.format').goimport()
    end,
    group = format_sync_grp
})

