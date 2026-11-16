local c = require("silk.palette")

local function mode(color)
  return {
    a = { fg = c.bg, bg = color, gui = "bold" },
    b = { fg = c.fg, bg = c.g0 },
    c = { fg = c.fg, bg = c.bg },
  }
end

return {
  normal   = mode(c.blue),
  insert   = mode(c.green),
  visual   = mode(c.peri),
  replace  = mode(c.red),
  command  = mode(c.yellow),

  inactive = {
    a = { fg = c.g4, bg = c.bg },
    b = { fg = c.g4, bg = c.bg },
    c = { fg = c.g4, bg = c.bg },
  },
}
