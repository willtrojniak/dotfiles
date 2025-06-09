#!/bin/bash

target="$1"

tmux swap-window -t $target
tmux select-window -t $target
