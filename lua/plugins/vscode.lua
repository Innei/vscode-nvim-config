return {
  {
    "vscode-neovim/vscode-multi-cursor.nvim",
    event = "VeryLazy",
    cond = not not vim.g.vscode,
    opts = {},
    config = function()
      require("vscode-multi-cursor").setup({})
      vim.keymap.set({ "n", "x", "i" }, "<C-d>", function()
        require("vscode-multi-cursor").addSelectionToNextFindMatch()
      end)
    end,
  },
}
