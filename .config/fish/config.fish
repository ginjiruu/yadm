alias vim nvim
alias vi nvim
alias icat chafa
alias rook-ceph "kubectl rook-ceph"
set -x EDITOR nvim
set -x KANIDM_NAME "ginjiruu"
# alias ghostty-ssh "infocmp -x | ssh pre-sftp-1 -- tic -x -"
# eval (ssh-agent -c)

if status is-interactive
    abbr --add kc kubectl
    abbr --add kb kubebuilder
    abbr --add gt go-task
    # Commands to run in interactive sessions can go here
    starship init fish | source
end
