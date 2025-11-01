local lazord = {}

function lazord.get(c, opts)
  -- stylua: ignore
  return {
    DiagnosticWarning          = "DiagnosticWarn",
    DiagnosticInformation      = "DiagnosticInfo",
    LspFloatWinNormal          = { bg = c.bg_float },
    LspFloatWinBorder          = { fg = c.border },
    LspSagaBorderTitle         = { fg = c.cyan },
    LspSagaHoverBorder         = { fg = c.blue },
    LspSagaRenameBorder        = { fg = c.green },
    LspSagaDefPreviewBorder    = { fg = c.green },
    LspSagaCodeActionBorder    = { fg = c.blue },
    LspSagaFinderSelection     = { fg = c.bg_visual },
    LspSagaCodeActionTitle     = { fg = c.cyan },
    LspSagaCodeActionContent   = { fg = c.purple },
    LspSagaSignatureHelpBorder = { fg = c.red },
    ReferencesCount            = { fg = c.purple },
    DefinitionCount            = { fg = c.purple },
    DefinitionIcon             = { fg = c.blue },
    ReferencesIcon             = { fg = c.blue },
    TargetWord                 = { fg = c.cyan },
    SagaShadow                 = { bg = c.bg_dark },
    SagaNormal                 = { bg = c.bg_float },
    SagaBorder                 = { fg = c.border, bg = c.bg_float },
  }
end

return lazord
