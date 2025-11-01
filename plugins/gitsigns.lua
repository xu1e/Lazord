local lazord = {}

function lazord.get(c, opts)
  -- stylua: ignore
  return {
    GitSignsAdd              = { fg = c.git.add }, -- diff mode: Added line |diff.txt|
    GitSignsChange           = { fg = c.git.change }, -- diff mode: Changed line |diff.txt|
    GitSignsDelete           = { fg = c.git.delete }, -- diff mode: Deleted line |diff.txt|
    GitSignsAddNr            = { fg = c.git.add },
    GitSignsChangeNr         = { fg = c.git.change },
    GitSignsDeleteNr         = { fg = c.git.delete },
    GitSignsAddLn            = { bg = c.diff.add },
    GitSignsChangeLn         = { bg = c.diff.change },
    GitSignsDeleteLn         = { bg = c.diff.delete },
    GitSignsCurrentLineBlame = { fg = c.comment, italic = true },
  }
end

return lazord
