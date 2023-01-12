local M = {
	"mfussenegger/nvim-dap",
	event = "BufReadPre",
	dependencies = {
		{
			"rcarriga/nvim-dap-ui",
			config = function()
				require("dapui").setup()
			end,
		},
		{

			"mfussenegger/nvim-dap-python",
		},
	},
}
function M.init()
	vim.keymap.set("n", "<leader>db", function()
		require("dap").toggle_breakpoint()
	end, { desc = "Toggle Breakpoint" })

	vim.keymap.set("n", "<leader>dc", function()
		require("dap").continue()
	end, { desc = "Continue" })

	vim.keymap.set("n", "<leader>do", function()
		require("dap").step_over()
	end, { desc = "Step Over" })

	vim.keymap.set("n", "<leader>di", function()
		require("dap").step_into()
	end, { desc = "Step Into" })

	vim.keymap.set("n", "<leader>dw", function()
		require("dap.ui.widgets").hover()
	end, { desc = "Widgets" })

	vim.keymap.set("n", "<leader>dr", function()
		require("dap").repl.open()
	end, { desc = "Repl" })

	vim.keymap.set("n", "<leader>du", function()
		require("dapui").toggle({})
	end, { desc = "Dap UI" })
end

function M.config()
	local dap = require("dap")
	local dapui = require("dapui")
	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open({})
	end
end

return M
