function __it2pwdstatus --on-variable PWD --description 'Update iTerm2 status'
    status --is-command-substitution; and return
    it2check; or return
    it2setkeylabel set status (basename $PWD)
end
