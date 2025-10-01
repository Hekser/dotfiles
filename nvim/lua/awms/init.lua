require("awms.options")
require("awms.keymap")
require("awms.lazy_init")

vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#00b7ff" }) -- Replace with desired color
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#6e7681" }) -- Above cursor
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#6e7681" }) -- Below cursor
