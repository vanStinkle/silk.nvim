local palette = require("silk.palette")
local c = palette[vim.o.background] or palette.dark

local function mode(color)
  return {
    a = { fg = c.g5, bg = color, gui = "bold" },
    b = { fg = c.fg, bg = c.g0 },
    c = { fg = c.fg, bg = c.bg },
  }
end

return {
  normal   = mode(c.bg_blue),
  insert   = mode(c.bg_green),
  visual   = mode(c.bg_purple),
  replace  = mode(c.bg_red),
  command  = mode(c.bg_yellow),

  inactive = {
    a = { fg = c.g4, bg = c.bg },
    b = { fg = c.g4, bg = c.bg },
    c = { fg = c.g4, bg = c.bg },
  },
}
