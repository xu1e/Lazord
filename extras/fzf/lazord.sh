#!/bin/bash

# =============================================================================
# Lazord Theme for FZF (Fuzzy Finder)
# =============================================================================
#
# A beautiful color scheme for FZF that matches the Lazord theme palette.
# Features:
# - Dark background with blue accents
# - High contrast text for readability
# - Highlighted search matches in blue
# - Green markers for selected items
# - Consistent with the overall Lazord theme
#
# Installation:
#   Add this line to your shell config (.bashrc, .zshrc, etc.):
#   source ~/path/to/Lazord/extras/fzf/lazord.sh
#
# Color Mapping:
#   Background:    #001e27 (main background)
#   Selection:     #002831 (selected item background)
#   Text:          #708284 (foreground text)
#   Highlights:    #2176c7 (search matches, prompt)
#   Borders:       #475b62 (borders and separators)
#   Markers:       #738a05 (selection markers)
# =============================================================================

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --highlight-line \
  --info=inline-right \
  --ansi \
  --layout=reverse \
  --border=none
  --color=bg+:#002831 \
  --color=bg:#001e27 \
  --color=border:#475b62 \
  --color=fg:#708284 \
  --color=gutter:#001e27 \
  --color=header:#2176c7 \
  --color=hl+:#2176c7 \
  --color=hl:#2176c7 \
  --color=info:#475b62 \
  --color=marker:#738a05 \
  --color=pointer:#2176c7 \
  --color=prompt:#2176c7 \
  --color=query:#708284:regular \
  --color=scrollbar:#475b62 \
  --color=separator:#475b62 \
  --color=spinner:#2176c7 \
"