#!/bin/bash
function tmux_create_session {
 tmux new-session -d -s session-2
 tmux new-window -t session-2:1
 tmux new-window -t session-2:2
 tmux new-window -t session-2:3
 tmux new-window -t session-2:4
 tmux new-window -t session-2:5
 tmux new-window -t session-2:6
 tmux new-window -t session-2:7
 tmux new-window -t session-2:8
 tmux new-window -t session-2:9

 tmux new-session -d -s session-1
 tmux new-window -t session-1:1
 tmux new-window -t session-1:2
 tmux new-window -t session-1:3
 tmux new-window -t session-1:4
 tmux new-window -t session-1:5
 tmux new-window -t session-1:6
 tmux new-window -t session-1:7
 tmux new-window -t session-1:8
 tmux new-window -t session-1:9

 tmux new-session -d -s session-0
 tmux new-window -t session-0:1
 tmux new-window -t session-0:2
 tmux new-window -t session-0:3
 tmux new-window -t session-0:4
 tmux new-window -t session-0:5
 tmux new-window -t session-0:6
 tmux new-window -t session-0:7
 tmux new-window -t session-0:8
 tmux new-window -t session-0:9

 tmux select-window -t session-0:1
 tmux -2 attach-session -d
}

function tmux_bind_keys {
 # Selecting Windows
 tmux bind-key -n M-0 select-window -t 0
 tmux bind-key -n M-1 select-window -t 1
 tmux bind-key -n M-2 select-window -t 2
 tmux bind-key -n M-3 select-window -t 3
 tmux bind-key -n M-4 select-window -t 4
 tmux bind-key -n M-5 select-window -t 5
 tmux bind-key -n M-6 select-window -t 6
 tmux bind-key -n M-7 select-window -t 7
 tmux bind-key -n M-8 select-window -t 8
 tmux bind-key -n M-9 select-window -t 9
 tmux bind-key -n M-w choose-window

 # Split Panes
 tmux bind-key -n M-% split-window -h
 tmux bind-key -n M-'"' split-window -v

 # Navigate Panes
 tmux bind-key -n M-Left  select-pane -L
 tmux bind-key -n M-Down  select-pane -D
 tmux bind-key -n M-Up    select-pane -U
 tmux bind-key -n M-Right select-pane -R
 tmux bind-key -n M-h select-pane -L
 tmux bind-key -n M-j select-pane -D
 tmux bind-key -n M-k select-pane -U
 tmux bind-key -n M-l select-pane -R

 tmux bind-key -n M-s choose-tree
 tmux bind-key -n M-'\' command-prompt

 tmux bind h select-pane -L
 tmux bind j select-pane -D
 tmux bind k select-pane -U
 tmux bind l select-pane -R
}

function tmux_unbind_keys {
 tmux unbind-key -n M-%
 tmux unbind-key -n M-'"'
 tmux unbind-key -n M-Left
 tmux unbind-key -n M-Down
 tmux unbind-key -n M-Up
 tmux unbind-key -n M-Right
 tmux unbind-key -n M-h
 tmux unbind-key -n M-j
 tmux unbind-key -n M-k
 tmux unbind-key -n M-l
 tmux unbind-key -n M-s
 tmux unbind-key -n M-'\'
 tmux unbind h
 tmux unbind j
 tmux unbind k
 tmux unbind l
}
