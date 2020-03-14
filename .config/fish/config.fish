
starship init fish | source
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
__it2pwdstatus
function iterm2_print_user_vars
  set -l kube_context (kubectl config current-context)
  iterm2_set_user_var kubeContext "$kube_context"
end
