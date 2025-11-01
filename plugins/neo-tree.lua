local lazord = {}

function lazord.get(c, opts)
  -- stylua: ignore
  return {
    NeoTreeNormal        = { fg = c.fg, bg = c.bg_sidebar },
    NeoTreeNormalNC      = { fg = c.fg, bg = c.bg_sidebar },
    NeoTreeDimText       = { fg = c.comment },
    NeoTreeMessage       = { fg = c.comment },
    NeoTreeGitModified   = { fg = c.yellow },
    NeoTreeGitDeleted    = { fg = c.red },
    NeoTreeGitAdded      = { fg = c.green },
    NeoTreeGitConflict   = { fg = c.purple },
    NeoTreeGitIgnored    = { fg = c.comment },
    NeoTreeGitRenamed    = { fg = c.cyan },
    NeoTreeGitStaged     = { fg = c.green },
    NeoTreeGitUntracked  = { fg = c.blue },
    NeoTreeFloatBorder   = { fg = c.border },
    NeoTreeFloatTitle    = { fg = c.blue, bold = true },
    NeoTreeTitleBar      = { fg = c.bg, bg = c.blue },
  }
end

return lazord
