local lazord = {}

function lazord.get(c, opts)
  -- stylua: ignore
  return {
    TreesitterContext = { bg = c.violet900 },
  }
end

return lazord
