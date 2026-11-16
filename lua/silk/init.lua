local c = require("silk.palette")

local m = {}

local function set(name, opts)
  vim.api.nvim_set_hl(0, name, opts)
end

function m.load()

  vim.cmd("highlight clear")
  vim.cmd("syntax reset")

  vim.o.background = "dark"
  vim.g.colors_name = "silk"



  -- ui
  set("normal",        { bg = c.bg, fg = c.fg })
  set("normalnc",      { link = "normal" })
  set("normalfloat",   { link = "normal" })
  set("floatborder",   { link = "normal" })
  set("floattitle",    { fg = c.g5 })
  set("floatfooter",   { fg = c.g4 })
  set("msgarea",       { link = "normal" })
  set("msgseparator",  { fg = c.g3 })
  set("endofbuffer",   { fg = c.bg })
  set("nontext",       { fg = c.g2 })
  set("whitespace",    { fg = c.g2 })
  set("specialkey",    { fg = c.g2 })
  set("conceal",       { fg = c.g3 })

  set("cursor",        { fg = c.bg, bg = c.fg })
  set("lcursor",       { link = "cursor" })
  set("cursorim",      { link = "cursor" })
  set("termcursor",    { link = "cursor" })
  set("termcursornc",  { fg = c.bg, bg = c.g3 })
  set("cursorline",    { bg = c.g0 })
  set("cursorcolumn",  { bg = c.g0 })
  set("colorcolumn",   { bg = c.g0 })

  set("visual",        { bg = c.g1 })
  set("visualnos",     { link = "visual" })
  set("matchparen",    { bg = c.g2, fg = c.g5 })
  set("search",        { bg = c.g2, fg = c.g5 })
  set("incsearch",     { bg = c.yellow, fg = c.bg })
  set("cursearch",     { bg = c.yellow, fg = c.bg })
  set("substitute",    { bg = c.red, fg = c.bg })
  set("quickfixline",  { bg = c.g1 })

  set("directory",     { fg = c.teal })
  set("title",         { fg = c.g5, bold = true })


  -- gutter
  set("linenr",          { fg = c.g3 })
  set("linenrabove",     { link = "linenr" })
  set("linenrbelow",     { link = "linenr" })
  set("cursorlinenr",    { bg = c.g0, fg = c.g5 })
  set("cursorlinesign",  { bg = c.g0 })
  set("cursorlinefold",  { bg = c.g0, fg = c.g3 })
  set("signcolumn",      { bg = c.bg })
  set("foldcolumn",      { fg = c.g3 })
  set("folded",          { fg = c.g4 })


  -- bars
  set("statusline",        { bg = c.bg, fg = c.fg })
  set("statuslinenc",      { bg = c.bg, fg = c.g4 })
  set("statuslineterm",    { link = "statusline" })
  set("statuslinetermnc",  { link = "statuslinenc" })
  set("winbar",            { bg = c.bg, fg = c.fg })
  set("winbarnc",          { bg = c.bg, fg = c.g4 })
  set("vertsplit",         { fg = c.g3 })
  set("winseparator",      { link = "vertsplit" })
  set("tabline",           { bg = c.g0, fg = c.g4 })
  set("tablinesel",        { bg = c.bg, fg = c.g5 })
  set("tablinefill",       { bg = c.g0 })


  -- messages
  set("modemsg",     { fg = c.fg })
  set("moremsg",     { fg = c.fg })
  set("question",    { fg = c.fg })
  set("okmsg",       { fg = c.green })
  set("warningmsg",  { fg = c.yellow })
  set("errormsg",    { fg = c.red })
  set("wildmenu",    { link = "pmenusel" })


  -- popup
  set("pmenu",          { bg = c.g0, fg = c.fg })
  set("pmenusel",       { bg = c.g1, fg = c.g5 })
  set("pmenukind",      { link = "pmenu" })
  set("pmenukindsel",   { link = "pmenusel" })
  set("pmenuextra",     { bg = c.g0, fg = c.g4 })
  set("pmenuextrasel",  { bg = c.g1, fg = c.g4 })
  set("pmenumatch",     { bg = c.g0, fg = c.g5, bold = true })
  set("pmenumatchsel",  { bg = c.g1, fg = c.g5, bold = true })
  set("pmenusbar",      { bg = c.g0 })
  set("pmenuthumb",     { bg = c.g3 })


  -- diff
  set("diffadd",     { fg = c.green, bg = c.g0 })
  set("diffchange",  { bg = c.g0 })
  set("diffdelete",  { fg = c.red, bg = c.g0 })
  set("difftext",    { fg = c.g5, bg = c.g2 })
  set("added",       { fg = c.green })
  set("changed",     { fg = c.yellow })
  set("removed",     { fg = c.red })


  -- spell
  set("spellbad",    { undercurl = true, sp = c.red })
  set("spellcap",    { undercurl = true, sp = c.yellow })
  set("spellrare",   { link = "spellcap" })
  set("spelllocal",  { link = "spellcap" })


  -- diagnostics
  local diagnostics = {
    error = c.red,
    warn  = c.yellow,
    info  = c.blue,
    hint  = c.teal,
    ok    = c.green,
  }

  for name, color in pairs(diagnostics) do
    set("diagnostic" .. name,            { fg = color })
    set("diagnosticvirtualtext" .. name, { fg = color })
    set("diagnosticfloating" .. name,    { fg = color })
    set("diagnosticsign" .. name,        { fg = color })
    set("diagnosticunderline" .. name,   { undercurl = true, sp = color })
  end

  for _, name in ipairs({ "info", "hint", "ok" }) do
    set("diagnosticvirtualtext" .. name, { fg = c.g4 })
  end

  set("diagnosticdeprecated",   { strikethrough = true, sp = c.red })
  set("diagnosticunnecessary",  { fg = c.g3 })


  -- syntax
  local plain = {
    "identifier",
    "statement",
    "conditional",
    "repeat",
    "label",
    "operator",
    "keyword",
    "exception",
    "preproc",
    "include",
    "define",
    "macro",
    "precondit",
    "type",
    "storageclass",
    "structure",
    "typedef",
    "special",
    "specialchar",
    "tag",
    "delimiter",
    "specialcomment",
    "debug",
    "@variable",
    "@function.call",
    "@function.method.call",
  }

  for _, group in ipairs(plain) do
    set(group, { fg = c.fg })
  end


  -- colored
  set("comment",   { fg = c.rust })
  set("todo",      { fg = c.bg, bg = c.yellow })

  set("string",    { fg = c.green })
  set("character", { link = "string" })

  set("constant",  { fg = c.peri })
  set("number",    { link = "constant" })
  set("boolean",   { link = "constant" })
  set("float",     { link = "constant" })

  set("function",  { fg = c.blue })

  -- misc
  set("error",       { fg = c.red, underline = true })
  set("underlined",  { fg = c.blue, underline = true })


  -- treesitter
  set("@constant.builtin",  { link = "constant" })
  set("@string.escape",     { link = "constant" })
  set("@string.regexp",     { link = "string" })

  set("@markup.heading",       { link = "title" })
  set("@markup.strong",        { bold = true })
  set("@markup.italic",        { fg = c.g5 })
  set("@markup.strikethrough", { strikethrough = true })
  set("@markup.underline",     { underline = true })
  set("@markup.link",          { fg = c.g4 })
  set("@markup.link.label",    { fg = c.fg })
  set("@markup.link.url",      { link = "underlined" })
  set("@markup.raw",           { link = "string" })
  set("@markup.raw.block",     { fg = c.fg })
  set("@markup.list",          { fg = c.g4 })
  set("@markup.quote",         { fg = c.g4 })


  -- lsp
  set("lspreferencetext",   { bg = c.g1 })
  set("lspreferenceread",   { bg = c.g1 })
  set("lspreferencewrite",  { bg = c.g1 })
  set("lspreferencetarget", { bg = c.g1 })
  set("lspinlayhint",       { fg = c.g3 })
  set("lspcodelens",        { fg = c.g3 })
  set("lspcodelensseparator", { fg = c.g2 })
  set("lspsignatureactiveparameter", { fg = c.g5, underline = true })

  -- semantic tokens
  set("@lsp.type.function",                { })
  set("@lsp.type.method",                  { })
  set("@lsp.typemod.function.declaration", { fg = c.blue })
  set("@lsp.typemod.method.declaration",   { fg = c.blue })
  set("@lsp.type.enummember",              { link = "constant" })


  -- terminal
  local terminal = {
    c.g0, c.red, c.green, c.yellow, c.blue, c.peri, c.teal, c.fg,
    c.g1, c.red, c.green, c.yellow, c.blue, c.peri, c.teal, c.g5,
  }

  for i, color in ipairs(terminal) do
    vim.g["terminal_color_" .. (i - 1)] = color
  end
end

return m
