require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
vim.keymap.set("n", "<leader>dn", function()
	require("dap-python").test_method()
end, { desc = "Test Method" })
vim.keymap.set("n", "<leader>df", function()
	require("dap-python").test_class()
end, { desc = "Test Class" })
local silent = { silent = true }
vim.keymap.set("v", "<leader>ds", '<ESC>:lua require("dap-python").debug_selection()<CR>', silent)
