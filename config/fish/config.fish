# Personal Fish Config 
#  _________         .    .
# (..       \_    ,  |\  /|
#  \       O  \  /|  \ \/ /
#   \______    \/ |   \  / 
#      vvvv\    \ |   /  |
#      \^^^^  ==   \_/   |
#       `\_   ===    \.  |
#       / /\_   \ /      |
#       |/   \_  \|      /
#              \________/

## Man Configuration
set -x MANROFFOPT "-c"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

# Source Aliases
source ~/.config/fish/alias.fish

# PATH Change
set -Ua fish_user_paths $HOME/.local/bin
set -x GOPATH $HOME/.local/go-pkg
set -x GOBIN $GOPATH/bin

# Global Envs
set -x HYPRSHOT_DIR $HOME/screenshots

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/home/rlm8291/.opam/opam-init/init.fish' && source '/home/rlm8291/.opam/opam-init/init.fish' > /dev/null 2> /dev/null; or true
# END opam configuration
