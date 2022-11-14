local status_ok, ls = pcall(require, "luasnip")
if not status_ok then
	return
end

ls.config.set_config {
  history = true,
  updateevents = "TextChanged, TextChangedI",
  enable_autosnippets = true,
}

vim.keymap.set({ "i", "s"}, "<c-l>", function ()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, {noremap = true, silent = true})

vim.keymap.set({ "i", "s"}, "<c-h>", function ()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, {noremap = true, silent = true})
