#
# .zshrc
#

bindkey -v

export KEYTIMEOUT=1

# Include alias file (if present) containing aliases for ssh, etc.
if [ -f ~/.aliases ]
then
  source ~/.aliases
fi

# If user binaries present, add them to the path.
if [ -d ~/.local/bin ]
then
    export PATH=~/.local/bin:$PATH
fi

# stuff.
if [ ! -f ~/src/agkozak-zsh-prompt/agkozak-zsh-prompt.plugin.zsh ]
then
    git clone https://github.com/agkozak/agkozak-zsh-prompt.git $HOME/src/agkozak-zsh-prompt/
    AGKOZAK_BLANK_LINES=1
    AGKOZAK_CUSTOM_SYMBOLS=( '⇣⇡' '⇣' '⇡' '+' 'x' '!' '>' '?' )
    AGKOZAK_USER_HOST_DISPLAY=1
    AGKOZAK_MULTILINE=1
    source ~/src/agkozak-zsh-prompt/agkozak-zsh-prompt.plugin.zsh
else
    AGKOZAK_BLANK_LINES=1
    AGKOZAK_CUSTOM_SYMBOLS=( '⇣⇡' '⇣' '⇡' '+' 'x' '!' '>' '?' )
    AGKOZAK_USER_HOST_DISPLAY=1
    AGKOZAK_MULTILINE=1
#   AGKOZAK_COLORS_USER_HOST=cyan
#   AGKOZAK_COLORS_PATH=green
  source ~/src/agkozak-zsh-prompt/agkozak-zsh-prompt.plugin.zsh
fi

# Allow history search via up/down keys.
if [ ! -f ~/src/zsh-history-substring-search/zsh-history-substring-search.zsh ]
then
    git clone https://github.com/zsh-users/zsh-history-substring-search.git $HOME/src/zsh-history-substring-search/
  source ~/src/zsh-history-substring-search/zsh-history-substring-search.zsh
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
  bindkey '\eOA' history-substring-search-up
  bindkey '\eOB' history-substring-search-down
  bindkey -M vicmd 'k' history-substring-search-up
  bindkey -M vicmd 'j' history-substring-search-down
else
  source ~/src/zsh-history-substring-search/zsh-history-substring-search.zsh
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
  bindkey '\eOA' history-substring-search-up
  bindkey '\eOB' history-substring-search-down
  bindkey -M vicmd 'k' history-substring-search-up
  bindkey -M vicmd 'j' history-substring-search-down
fi

# Add keybinds for emacs mode
if [ -d /home/fishd ]
then
  bindkey "\e[1;3D" backward-word
  bindkey "\e[1;3C" forward-word
  bindkey "^[[1;9D" beginning-of-line
  bindkey "^[[1;9C" end-of-line
fi

if [ ! -f ~/src/zsh-autosuggestions/zsh-autosuggestions.zsh  ]
then
    git clone https://github.com/zsh-users/zsh-autosuggestions.git $HOME/src/zsh-autosuggestions/
    source ~/src/zsh-autosuggestions/zsh-autosuggestions.zsh
else
    source ~/src/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
HISTDUP=erase
setopt appendhistory
setopt hist_ignore_space
setopt EXTENDED_HISTORY          # write the history file in the ":start:elapsed;command" format.
setopt HIST_REDUCE_BLANKS        # remove superfluous blanks before recording entry.
setopt SHARE_HISTORY             # share history between all sessions.
setopt HIST_IGNORE_ALL_DUPS      # delete old recorded entry if new entry is a duplicate.
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Keybindings
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Include local config if present
if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi

if [ ! -f ~/src/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]
then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/src/zsh-syntax-highlighting/
    source ~/src/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
    source ~/src/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
