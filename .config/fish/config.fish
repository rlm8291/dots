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

