function n
    # If no argument is provided, use fzf and ripgrep to select a directory
    if test -z "$argv"
        set selected_file (rg --files --hidden --glob '!{.git,node_modules,.local}' | fzf --preview 'bat --style=numbers --color=always {}' --preview-window=right:70%)
        if test -z "$selected_file"
            echo "No directory selected."
            return 1
        end
        set dir (dirname $selected_file)
    else
        set dir $argv[1]
    end

    # Change to the selected directory
    cd $dir

    # Start or attach to a tmux session
    tmux new-session -d -c $dir -s "nvim_session" "nvim"

    # Split tmux into two panes: upper 80% for Neovim, lower 20% for shell
    tmux split-window -c $dir -p 20
    tmux select-pane -t 0
    tmux attach-session -t "nvim_session"
end
