local M = {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-nvim-lsp',
        "saadparwaiz1/cmp_luasnip",
    },
}

function M.config()
    local cmp = require("cmp")

    cmp.setup {
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end,
        },

        mapping = cmp.mapping.preset.insert {
            ["<C-k>"] = cmp.mapping.scroll_docs(-1),
            ["<C-j>"] = cmp.mapping.scroll_docs(1),
            ["<C-e>"] = cmp.mapping.close(),
            ["<C-y>"] = cmp.mapping(
                cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true,
                },
                { "i", "c" }
            ),
            ["<c-space>"] = cmp.mapping {
                i = cmp.mapping.complete(),
                c = function(
        _ --[[fallback]]
                )
                    if cmp.visible() then
                        if not cmp.confirm { select = true } then
                            return
                        end
                    else
                        cmp.complete()
                    end
                end,
            },
            ["<tab>"] = cmp.config.disable,
            ["<c-q>"] = cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            },
        },
        formatting = {
            format = require("conf.plugins.lsp.kind").cmp_format(),
        },
        sources = cmp.config.sources {
            { name = "nvim_lua" },
            { name = "nvim_lsp_signature_help" },
            { name = "luasnip" },
            { name = "nvim_lsp", keyword_length = 2 },
            { name = "buffer", keyword_length = 5 },
            { name = "path" },
        },
        confirm_opts = {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        },
        window = {
            documentation = cmp.config.window.bordered(),
            completion = cmp.config.window.bordered(),
        },
        experimental = {
            ghost_text = false
        }
    }
end

return M
