# AutoLoad Zsh compinit function
autoload -U compinit promptinit
compinit
promptinit
prompt walters

# Use color
autoload -Uz colors
colors

# Prompt
PROMPT="%(?.%{${fg[green]}%}.%{${fg[red]}%})%n${reset_color}@${fg[blue]}%m${reset_color} %~
%# "

# History
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

# Prompt for Git
RPROMPT="%{${fg[blue]}%}[%~]%{${reset_color}%}"
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' ignore-parents parent pwd ..
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
  /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'


# VCS Info
autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

function _update_vcs_info_msg() {
        LANG=en_US.UTF-8 vcs_info
        RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg

# Set User Options
setopt rcs
setopt aliases
setopt bad_pattern
setopt always_last_prompt
setopt always_to_end
setopt print_eight_bit
setopt no_beep
setopt no_flow_control
setopt ignore_eof
setopt interactive_comments
setopt hist_reduce_blanks
setopt extended_glob
setopt list_types
setopt auto_menu
setopt auto_param_keys
setopt auto_param_slash
setopt auto_cd
setopt magic_equal_subst
setopt long_list_jobs
setopt multios
setopt nomatch
setopt mark_dirs
setopt noautoremoveslash

# Unset User Options
unsetopt correct
unsetopt long_list_jobs
unsetopt menu_complete
unsetopt numeric_glob_sort
unsetopt magic_equal_subst
unsetopt mail_warning
unsetopt rec_exact

# Global Alias
alias -g T="| tee"
alias -g G="| grep"
alias -g L="|& $PAGER"
alias -g WC="| wc"
alias -g LC="| wc -l"
alias -g Z="| tail"
alias brew="PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin brew"

# Enable Color Support
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# Alias
alias la='ls -a'
alias ll='ls -l'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vim='nvim'
alias vz='nvim ~/.zshrc'
alias mkdir='mkdir -p'
alias skim='open -a /Applications/Skim.app'
alias py='python'

# Vim Keybind
bindkey -v
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified
