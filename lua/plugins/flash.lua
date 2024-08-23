return {
  "folke/flash.nvim",
  keys = {
    {
      "s",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "Flash",
    },
    {
      "S",
      mode = { "n" },
      function()
        require("flash").treesitter()
      end,
      desc = "Flash Treesitter",
    },
    {
      "r",
      mode = "o",
      function()
        require("flash").remote()
      end,
      desc = "Remote Flash",
    },
    {
      "R",
      mode = { "o", "x" },
      function()
        require("flash").treesitter_search()
      end,
      desc = "Treesitter Search",
    },
    {
      "<c-s>",
      mode = { "c" },
      function()
        require("flash").toggle()
      end,
      desc = "Toggle Flash Search",
    },
  },
  opts = {
    jump = {
      -- save location in the jumplist
      jumplist = true,
      -- jump position
      pos = "end", ---@type "start" | "end" | "range"
      -- add pattern to search history
      history = false,
      -- add pattern to search register
      register = false,
      -- clear highlight after jump
      nohlsearch = true,
      -- automatically jump when there is only one match
      autojump = true,
      -- You can force inclusive/exclusive jumps by setting the
      -- `inclusive` option. By default it will be automatically
      -- set based on the mode.
      inclusive = nil, ---@type boolean?
      -- jump position offset. Not used for range jumps.
      -- 0: default
      -- 1: when pos == "end" and pos < current position
      offset = nil, ---@type number
    },
  },
}