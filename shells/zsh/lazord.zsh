# Lazord ZSH Theme Configuration
# Add this to your .zshrc or use with oh-my-zsh

# Lazord colors for ZSH
export LAZORD_BG="#001e27"
export LAZORD_FG="#708284"
export LAZORD_BLUE="#2176c7"
export LAZORD_GREEN="#738a05"
export LAZORD_YELLOW="#a57706"
export LAZORD_RED="#d11c24"
export LAZORD_PURPLE="#c61c6f"
export LAZORD_CYAN="#259286"
export LAZORD_COMMENT="#475b62"

# Set LS_COLORS for better file listing
export LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32"

# Prompt colors (if using a custom prompt)
autoload -U colors && colors
PROMPT="%{$fg[blue]%}%n%{$reset_color%}@%{$fg[cyan]%}%m%{$reset_color%}:%{$fg[yellow]%}%~%{$reset_color%}$ "

# Right prompt with git info (requires git plugin)
if command -v git &> /dev/null; then
    autoload -Uz vcs_info
    precmd() { vcs_info }
    zstyle ':vcs_info:git:*' formats '%b'
    setopt PROMPT_SUBST
    RPROMPT='%{$fg[green]%}${vcs_info_msg_0_}%{$reset_color%}'
fi