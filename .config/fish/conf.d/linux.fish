set fish_user_paths $HOME/.pyenv/bin $HOME/.rbenv/bin $fish_user_paths
if test -e ~/.linuxbrew/bin/brew
    eval (~/.linuxbrew/bin/brew shellenv)
end
if test -e /home/linuxbrew/.linuxbrew/bin/brew
    eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end
