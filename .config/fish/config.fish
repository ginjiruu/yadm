alias vim nvim
alias vi nvim
set -x EDITOR nvim

if status is-interactive
    abbr --add kc kubectl
    abbr --add kb kubebuilder
    abbr --add gt go-task
    # Commands to run in interactive sessions can go here
    starship init fish | source
end
