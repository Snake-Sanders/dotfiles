#!/bin/bash

# Create a new detached tmux session named "exercism"
tmux new-session -d -s exercism -n exercism

# Change directory and start Nushell in the first pane
tmux send-keys -t exercism "cd ~/Exercism/rust && nu" C-m

# Split the window vertically
tmux split-window -h -t exercism

# Change directory and start Nushell in the second pane
tmux send-keys -t exercism "cd ~/Exercism/rust && nu" C-m

# Attach to the session
tmux attach-session -t exercism

