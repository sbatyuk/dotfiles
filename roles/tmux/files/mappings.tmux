############################################################################
# Karabiner maps [COMMAND -> OPTION] while in iTerm
# All bindings are made with "-n" and can be invoked without tmux prefix
############################################################################

unbind -a # unbind all default key bindings

bind -n M-e copy-mode # tmux copy mode is like vim normal mode

bind -nr M-H resize-pane -L 5
bind -nr M-J resize-pane -D 5
bind -nr M-K resize-pane -U 5
bind -nr M-L resize-pane -R 5

bind -n M-b resize-pane -Z

# https://github.com/christoomey/vim-tmux-navigator#add-a-snippet
is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
    | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"

bind -n 'M-h' if-shell "$is_vim" 'send-keys M-h'  'select-pane -L'
bind -n 'M-j' if-shell "$is_vim" 'send-keys M-j'  'select-pane -D'
bind -n 'M-k' if-shell "$is_vim" 'send-keys M-k'  'select-pane -U'
bind -n 'M-l' if-shell "$is_vim" 'send-keys M-l'  'select-pane -R'

bind -T copy-mode-vi 'M-h' select-pane -L
bind -T copy-mode-vi 'M-j' select-pane -D
bind -T copy-mode-vi 'M-k' select-pane -U
bind -T copy-mode-vi 'M-l' select-pane -R
