if not vim.g.vscode then
  return {}
end

local M = {}

local augroup = vim.api.nvim_create_augroup
local keymap = vim.api.nvim_set_keymap

M.my_vscode = augroup("MyVSCode", {})

local function notify(cmd)
  return string.format("<cmd>call VSCodeNotify('%s')<CR>", cmd)
end

local function v_notify(cmd)
  return string.format("<cmd>call VSCodeNotifyVisual('%s', 1)<CR>", cmd)
end

keygap("n", "gr", notify("editor.action.goToReferences"), { silent = true })
keymap("n", "<Leader>rn", notify("editor.action.rename"), { silent = true })

keymap("n", "<Leader>/", notify("workbench.action.findInFiles"), { silent = true }) -- use ripgrep to search files
keymap('n', '<Leader>gcc', notify('editor.action.addCommentLine'), { silent = true })
keymap('v', '<Leader>gc', notify('editor.action.addCommentLine'), { silent = true }

return M