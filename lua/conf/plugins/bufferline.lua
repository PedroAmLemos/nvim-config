local M = {
   "akinsho/bufferline.nvim",
   event = "BufAdd"
}

function M.config ()
    local bufferline = require('bufferline')
    bufferline.setup{}
end

return M