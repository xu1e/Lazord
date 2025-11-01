local lazord = {}

function lazord.get(c, opts)
  -- stylua: ignore
  return {
    NoiceCompletionItemKindDefault = { fg = c.comment, bg = c.none },
    NoiceCmdline                   = { bg = c.bg_float },
    NoiceCmdlineIcon               = { fg = c.blue },
    NoiceCmdlinePopup              = { bg = c.bg_float },
    NoiceCmdlinePopupBorder        = { fg = c.border },
    NoiceConfirm                   = { bg = c.bg_float },
    NoiceConfirmBorder             = { fg = c.border },
    NoiceCursor                    = { fg = c.bg, bg = c.fg },
    NoiceFormatProgressDone        = { bg = c.green },
    NoiceFormatProgressTodo        = { bg = c.comment },
    NoiceLspProgressClient         = { fg = c.blue },
    NoiceLspProgressSpinner        = { fg = c.cyan },
    NoiceLspProgressTitle          = { fg = c.fg },
    NoiceMini                      = { bg = c.bg_statusline },
    NoicePopup                     = { bg = c.bg_float },
    NoicePopupBorder               = { fg = c.border },
    NoiceScrollbar                 = { bg = c.bg_highlight },
    NoiceScrollbarThumb            = { bg = c.comment },
    NoiceSplit                     = { bg = c.bg_float },
    NoiceSplitBorder               = { fg = c.border },
    NoiceVirtualText               = { fg = c.comment },
  }
end

return lazord
