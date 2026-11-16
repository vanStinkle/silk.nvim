local palette = require("silk.palette")
local c = palette[vim.o.background] or palette.dark

local mode = {
  a = { fg = c.g5, bg = c.bg_blue, gui = "bold" },
  b = { fg = c.fg, bg = c.bg },
  c = { fg = c.fg, bg = c.bg },
}

return {
  normal   = mode,
  insert   = mode,
  visual   = mode,
  replace  = mode,
  command  = mode,

  inactive = {
    a = { fg = c.g4, bg = c.bg },
    b = { fg = c.g4, bg = c.bg },
    c = { fg = c.g4, bg = c.bg },
  },
}
