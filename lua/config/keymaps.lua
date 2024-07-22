local mode_all = { "n", "v", "i" }
local mode_nv = { "n", "v" }
local mode_v = { "v" }
local mode_i = { "i" }
local mode_ni = { "n", "i" }

local nmappings = {
  -- page scroll
  { from = ";", to = ":", mode = mode_nv },
  { from = "y", to = '"+y' },
  { from = "y", to = '"+ygv<esc>', mode = mode_v },
  { from = "`", to = "~", mode = mode_nv },

  { from = "<C-i>", to = "<C-d>", mode = mode_nv },
  { from = "-", to = "<C-x>" },
  { from = "=", to = "<C-a>" },
  { from = "<C-;>", to = "<Right>", mode = mode_i },
  { from = "X", to = "r" },
  { from = "r", to = "<c-r>" }, --
  { from = "cw", to = '"_ciw' },
  { from = "!", to = "%", mode = mode_nv },
  { from = "0", to = "^" },
  { from = ")", to = "g_" },
  { from = "p", to = "P", mode = mode_v },
  { from = "x", to = '"_x' },
  { from = "x", to = '"_x', mode = mode_v },
  { from = "c", to = '"_c' },
  { from = "c", to = '"_c', mode = mode_v },
  { from = ",", to = "<c-o>" },
  { from = ".", to = "<c-i>" },
  { from = ",", to = "^", mode = mode_v },
  { from = ".", to = "g_", mode = mode_v },
  { from = "J", to = "5j", mode = mode_nv },
  { from = "K", to = "5k", mode = mode_nv },
}

for _, mapping in ipairs(nmappings) do
  vim.keymap.set(mapping.mode or "n", mapping.from, mapping.to, {
    noremap = mapping.noremap or true,
    silent = true,
    desc = mapping.desc,
  })
end

-- delete lazynvim built-in keymaps
vim.keymap.del({ "n", "x" }, "j")
vim.keymap.del({ "n", "x" }, "k")

vim.api.nvim_set_keymap("n", "j", "<Plug>(accelerated_jk_gj)", {})
vim.api.nvim_set_keymap("n", "k", "<Plug>(accelerated_jk_gk)", {})
