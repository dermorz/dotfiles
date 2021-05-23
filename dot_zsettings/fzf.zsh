export FZF_DEFAULT_COMMAND='rg --files --hidden --smart-case --glob "!.git/*"'
export FZF_DEFAULT_OPTS='--height 40% --reverse --inline-info'
export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"


# Auto-completion
# ---------------
_fzf_compgen_path() {
  ag -g "" "$1"
}

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/share/fzf/completion.zsh" 2> /dev/null

# Key bindings
# ------------
[ -f /usr/share/fzf/shell/key-bindings.zsh ] && source /usr/share/fzf/shell/key-bindings.zsh
