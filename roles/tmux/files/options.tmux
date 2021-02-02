############################################################################################################
# General options
############################################################################################################

set -g allow-rename off                     # disable "Allow programs to change the window name"
set -g automatic-rename off                 # disable "Automatic window renaming"
set -g base-index 1                         # set base index for windows to 1 instead of 0
set -g default-terminal "screen-256color"   # set 256color mode for iTerm2 usage
set -g display-time 3000                    # tmux messages displayed for 3 seconds
set -g escape-time 0                        # removes escape delay for Vim to catch esc immediately
set -g focus-events on                      # enables vim to get focus events needed by GitGutter plugin e.g.
set -g history-limit 20000                  # increasing scrollback buffer size
set -g renumber-windows on                  # automatic renumbering of windows after one closes

############################################################################################################
# Statusline options
############################################################################################################

set -g @dracula-show-battery        false
set -g @dracula-show-network        false
set -g @dracula-show-weather        false
set -g @dracula-show-time           false
set -g @dracula-show-location       false

set -g @dracula-show-powerline      true
set -g @dracula-show-flags          false
set -g @dracula-show-left-icon      smiley
set -g @dracula-border-contrast     true
