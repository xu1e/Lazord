#!/usr/bin/env bash

# =============================================================================
# Lazord Theme for Tmux
# =============================================================================
# 
# A beautiful, cohesive tmux theme that matches the Lazord color palette.
# Features:
# - Status bar with session name and system info
# - Active pane highlighting with blue borders
# - Window status indicators with visual feedback
# - Support for tmux-prefix-highlight plugin
# - Both 12-hour and 24-hour clock format support
#
# Installation:
#   Add this line to your ~/.tmux.conf:
#   source-file ~/path/to/Lazord/extras/tmux/lazord.tmux
#
# Color Palette:
#   Background: #001e27 (deep dark blue)
#   Foreground: #708284 (muted blue-gray)
#   Blue:       #2176c7 (primary accent)
#   Comment:    #475b62 (borders and inactive)
#   Selection:  #002831 (status background)
#   Yellow:     #a57706 (prefix highlight)
# =============================================================================

# Lazord colors for Tmux

set -g mode-style "fg=#2176c7,bg=#475b62"

set -g message-style "fg=#2176c7,bg=#475b62"
set -g message-command-style "fg=#2176c7,bg=#475b62"

set -g pane-border-style "fg=#475b62"
set -g pane-active-border-style "fg=#2176c7"

set -g status "on"
set -g status-justify "left"

set -g status-style "fg=#2176c7,bg=#002831"

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style NONE
set -g status-right-style NONE

set -g status-left "#[fg=#001e27,bg=#2176c7,bold] #S #[fg=#2176c7,bg=#002831,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=#002831,bg=#002831,nobold,nounderscore,noitalics]#[fg=#2176c7,bg=#002831] #{prefix_highlight} #[fg=#475b62,bg=#002831,nobold,nounderscore,noitalics]#[fg=#2176c7,bg=#475b62] %Y-%m-%d  %I:%M %p #[fg=#2176c7,bg=#475b62,nobold,nounderscore,noitalics]#[fg=#001e27,bg=#2176c7,bold] #h "
if-shell '[ "$(tmux show-option -gqv "clock-mode-style")" == "24" ]' {
  set -g status-right "#[fg=#002831,bg=#002831,nobold,nounderscore,noitalics]#[fg=#2176c7,bg=#002831] #{prefix_highlight} #[fg=#475b62,bg=#002831,nobold,nounderscore,noitalics]#[fg=#2176c7,bg=#475b62] %Y-%m-%d  %H:%M #[fg=#2176c7,bg=#475b62,nobold,nounderscore,noitalics]#[fg=#001e27,bg=#2176c7,bold] #h "
}

setw -g window-status-activity-style "underscore,fg=#708284,bg=#002831"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=#708284,bg=#002831"
setw -g window-status-format "#[fg=#002831,bg=#002831,nobold,nounderscore,noitalics]#[default] #I  #W #F #[fg=#002831,bg=#002831,nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=#002831,bg=#475b62,nobold,nounderscore,noitalics]#[fg=#2176c7,bg=#475b62,bold] #I  #W #F #[fg=#475b62,bg=#002831,nobold,nounderscore,noitalics]"

# tmux-plugins/tmux-prefix-highlight support
set -g @prefix_highlight_output_prefix "#[fg=#a57706]#[bg=#002831]#[fg=#002831]#[bg=#a57706]"
set -g @prefix_highlight_output_suffix ""