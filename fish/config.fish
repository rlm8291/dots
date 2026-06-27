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
set -x EDITOR nvim

# Source Aliases
source ~/.config/fish/alias.fish

# GO Configuration
set -gx GOPATH $HOME/.local/go
set -gx GOBIN $HOME/.local/go/bin
