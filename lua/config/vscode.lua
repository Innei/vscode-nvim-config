if not vim.g.vscode then
  return {}
end

local M = {}

local augroup = vim.api.nvim_create_augroup
local keymap = vim.api.nvim_set_keymap

M.my_vscode = augroup("MyVSCode", {})

local function notify(cmd, opt)
  return string.format("<cmd>lua require('vscode').call('%s', { args = { %s } })<CR>", cmd, opt)
end

-- local function v_notify(cmd, opt)
--   return string.format("<cmd>lua require('vscode').call('%s')<CR>", cmd)
-- end

keymap("n", "gr", notify("workbench.action.openGlobalSettings"), { silent = true })
keymap("n", "<Leader>rn", notify("editor.action.rename"), { silent = true })

keymap("n", "<Leader>/", notify("workbench.action.findInFiles"), { silent = true }) -- use ripgrep to search files
keymap("n", "<Leader>pr", notify("workbench.action.replaceInFiles"), { silent = true }) -- use ripgrep to search files
keymap("n", "<Leader>gcc", notify("editor.action.addCommentLine"), { silent = true })
keymap("v", "<Leader>gc", notify("editor.action.addCommentLine"), { silent = true })
keymap("n", "<leader>bq", notify("workbench.action.closeOtherEditors"), { silent = true })

-- delete lazynvim built-in keymaps
vim.keymap.del({ "n" }, "]e")
vim.keymap.del({ "n" }, "[e")
vim.keymap.del({ "n" }, "[d")
vim.keymap.del({ "n" }, "]d")
vim.keymap.del({ "n" }, "]w")
vim.keymap.del({ "n" }, "[w")
vim.keymap.del({ "n" }, "]b")
vim.keymap.del({ "n" }, "[b")

keymap("n", "]d", notify("editor.action.marker.next"), { silent = true })
keymap("n", "[d", notify("editor.action.marker.prev"), { silent = true })

keymap("n", "]w", notify("editor.action.marker.next", "Warning"), { silent = true })
keymap("n", "]e", notify("editor.action.marker.next", "Error"), { silent = true })

keymap("n", "[w", notify("editor.action.marker.prev", "Warning"), { silent = true })
keymap("n", "[e", notify("editor.action.marker.prev", "Error"), { silent = true })

keymap('n', '[b', notify('workbench.action.previousEditor'), { silent = true })
keymap('n', ']b', notify('workbench.action.nextEditor'), { silent = true })

return M