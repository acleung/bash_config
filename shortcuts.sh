function tmux_create_sessions {
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
