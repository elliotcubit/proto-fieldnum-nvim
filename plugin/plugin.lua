local mod = require("fieldnum.foo")

vim.api.nvim_create_user_command("Renumber", mod['renumber'], {range = true, nargs='?'})
