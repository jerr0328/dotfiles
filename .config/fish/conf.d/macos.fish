set fish_user_paths $fish_user_paths /usr/local/opt/go/libexec/bin
set -gx LDFLAGS "-L/usr/local/opt/zlib/lib"
set -gx CPPFLAGS "-I/usr/local/opt/zlib/include"
set -gx PKG_CONFIG_PATH "/usr/local/opt/zlib/lib/pkgconfig"
set -gx HOMEBREW_CASK_OPTS "--appdir=~/Applications"

