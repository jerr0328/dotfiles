set fish_user_paths $HOME/bin $HOME/.pyenv/bin $HOME/.pyenv/shims $HOME/.rbenv/shims $fish_user_paths /usr/local/sbin /usr/local/opt/go/libexec/bin
set -gx LC_ALL en_IE.UTF-8
set -gx LANG en_IE.UTF-8
set -gx GOPATH $HOME/work
set -gx LDFLAGS "-L/usr/local/opt/zlib/lib"
set -gx CPPFLAGS "-I/usr/local/opt/zlib/include"
set -gx PKG_CONFIG_PATH "/usr/local/opt/zlib/lib/pkgconfig"
