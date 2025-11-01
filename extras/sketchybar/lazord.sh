#!/bin/bash

# =============================================================================
# Lazord Theme for SketchyBar (macOS Menu Bar)
# =============================================================================
#
# A sophisticated SketchyBar configuration using the Lazord color palette.
# Features:
# - Dark themed menu bar with blue accents
# - Color-coded system information (battery, volume, clock)
# - Workspace indicators with highlighting
# - Consistent spacing and typography
# - Front app display with cyan accent
#
# Installation:
#   Source this file in your SketchyBar configuration:
#   source ~/path/to/Lazord/extras/sketchybar/lazord.sh
#
# Requirements:
#   - SketchyBar installed and configured
#   - SF Pro font (system default on macOS)
#   - Plugin scripts in $PLUGIN_DIR (customize as needed)
#
# Color Variables:
#   Each color is prefixed with 0xff for SketchyBar's ARGB format
# =============================================================================

# Lazord color palette for SketchyBar
export LAZORD_BG=0xff001e27
export LAZORD_FG=0xff708284
export LAZORD_BLUE=0xff2176c7
export LAZORD_GREEN=0xff738a05
export LAZORD_YELLOW=0xffa57706
export LAZORD_RED=0xffd11c24
export LAZORD_PURPLE=0xffc61c6f
export LAZORD_CYAN=0xff259286
export LAZORD_COMMENT=0xff475b62
export LAZORD_HIGHLIGHT=0xff002831
export LAZORD_BORDER=0xff475b62

# SketchyBar configuration with Lazord theme
sketchybar --bar height=32 \
                 blur_radius=30 \
                 position=top \
                 sticky=off \
                 padding_left=10 \
                 padding_right=10 \
                 color=$LAZORD_BG

# Default item settings
sketchybar --default icon.font="SF Pro:Semibold:15.0" \
                     icon.color=$LAZORD_FG \
                     label.font="SF Pro:Semibold:15.0" \
                     label.color=$LAZORD_FG \
                     background.color=$LAZORD_HIGHLIGHT \
                     background.corner_radius=6 \
                     background.height=24 \
                     padding_left=5 \
                     padding_right=5 \
                     label.padding_left=4 \
                     label.padding_right=10 \
                     icon.padding_left=10 \
                     icon.padding_right=4

# Clock
sketchybar --add item clock right \
           --set clock update_freq=10 \
                      icon=󰃰 \
                      icon.color=$LAZORD_BLUE \
                      script="$PLUGIN_DIR/clock.sh"

# Battery
sketchybar --add item battery right \
           --set battery update_freq=120 \
                        icon.color=$LAZORD_GREEN \
                        script="$PLUGIN_DIR/battery.sh"

# Volume
sketchybar --add item volume right \
           --set volume script="$PLUGIN_DIR/volume.sh" \
                       icon.color=$LAZORD_PURPLE

# Spaces (workspaces)
SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10")

for i in "${!SPACE_ICONS[@]}"
do
  sid=$(($i+1))
  sketchybar --add space space.$sid left \
             --set space.$sid space=$sid \
                             icon=${SPACE_ICONS[i]} \
                             icon.color=$LAZORD_COMMENT \
                             icon.highlight_color=$LAZORD_BLUE \
                             label.padding_right=20 \
                             label.color=$LAZORD_COMMENT \
                             label.highlight_color=$LAZORD_BLUE \
                             label.font="sketchybar-app-font:Regular:16.0" \
                             label.y_offset=-1 \
                             background.color=$LAZORD_BG \
                             background.border_color=$LAZORD_BORDER \
                             background.border_width=2 \
                             script="$PLUGIN_DIR/space.sh"
done

# Front App
sketchybar --add item front_app left \
           --set front_app icon.color=$LAZORD_CYAN \
                          label.color=$LAZORD_FG \
                          script="$PLUGIN_DIR/front_app.sh" \
           --subscribe front_app front_app_switched

sketchybar --update