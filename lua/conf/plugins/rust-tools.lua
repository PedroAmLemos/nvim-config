local M = {
	"simrat39/rust-tools.nvim",
}
-- Update this path
local extension_path = vim.env.HOME .. "/Builds/codelldb/extensions/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.so"


-- Normal setup
function M.setup(on_attach)
	local rt = require("rust-tools")
	rt.setup({
		server = {
			on_attach = on_attach,
			["rust_analyzer"] = {
				cargo = { allFeatures = true },
				check_on_save = {
					command = "clippy",
				},
			},
		},
		tools = { -- rust-tools options
			--   -- how to execute terminal commands
			--   -- options right now: termopen / quickfix
			--   executor = require("rust-tools/executors").termopen,

			runnables = {
				-- whether to use telescope for selection menu or not
				use_telescope = true,

				-- rest of the opts are forwarded to telescope
			},

			debuggables = {
				-- whether to use telescope for selection menu or not
				use_telescope = true,

				-- rest of the opts are forwarded to telescope
			},

			--   -- These apply to the default RustSetInlayHints command
			inlay_hints = {

				--     -- Only show inlay hints for the current line

				--     -- Event which triggers a refersh of the inlay hints.
				--     -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
				--     -- not that this may cause  higher CPU usage.
				--     -- This option is only respected when only_current_line and
				--     -- autoSetHints both are true.
				--     only_current_line_autocmd = "CursorHold",

				--     -- wheter to show parameter hints with the inlay hints or not
				show_parameter_hints = true,

				--     -- prefix for parameter hints
				parameter_hints_prefix = "  <-  ",

				--     -- prefix for all the other hints (type, chaining)
				other_hints_prefix = "  =>  ",

				--     -- whether to align to the length of the longest line in the file
				-- max_len_align = true,

				--     -- padding from the left if max_len_align is true
				-- max_len_align_padding = 10,

				--     -- whether to align to the extreme right or not
				right_align = false,

				--     -- padding from the right if right_align is true
				--     right_align_padding = 7,

				--     -- The color of the hints
				highlight = "LspCodeLens",
			},
			hover_actions = {
				auto_focus = false,
			},

			--   hover_actions = {
			--     -- the border that is used for the hover window
			--     -- see vim.api.nvim_open_win()
			--     border = {
			--       { "╭", "FloatBorder" },
			--       { "─", "FloatBorder" },
			--       { "╮", "FloatBorder" },
			--       { "│", "FloatBorder" },
			--       { "╯", "FloatBorder" },
			--       { "─", "FloatBorder" },
			--       { "╰", "FloatBorder" },
			--       { "│", "FloatBorder" },
			--     },

			--     -- whether the hover action window gets automatically focused
			--     auto_focus = false,
			--   },

			--   -- settings for showing the crate graph based on graphviz and the dot
			--   -- command
			--   crate_graph = {
			--     -- Backend used for displaying the graph
			--     -- see: https://graphviz.org/docs/outputs/
			--     -- default: x11
			--     backend = "x11",
			--     -- where to store the output, nil for no output stored (relative
			--     -- path from pwd)
			--     -- default: nil
			--     output = nil,
			--     -- true for all crates.io and external crates, false only the local
			--     -- crates
			--     -- default: true
			--     full = true,
			--   },
			dap = {
				adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
			},
		},
	})
end

return M
