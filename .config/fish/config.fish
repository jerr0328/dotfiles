rvm default
alias unset 'set --erase'
alias brewupclean 'brew update; and brew upgrade; and brew cleanup'

set -g fish_user_paths "/usr/local/opt/sqlite/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/libxml2/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/gdal2/bin" $fish_user_paths
