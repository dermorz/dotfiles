# <C-b> to open git branch selector
is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

fzf-down() {
  fzf --height 40% "$@"
}

gb() {
  is_in_git_repo || return
  git branch -a --color=always \
    | grep -v '/HEAD\s' \
    | sort \
    | fzf-down --ansi --multi --tac \
    | sed 's/^..//' \
    | cut -d' ' -f1 \
    | sed 's#^remotes/origin/##' \
    | grep -v origin
}

join-lines() {
  local item
  while read item; do
    echo -n "${(q)item} "
  done
}

fzf-gb-widget() {
  zle reset-prompt
  LBUFFER+=$(gb | join-lines)
}
autoload -U fzf-gb-widget
zle -N fzf-gb-widget
bindkey '^B' fzf-gb-widget

# Enable select-quoted
autoload -U select-quoted
zle -N select-quoted
for m in visual viopp; do
	for c in {a,i}{\',\",\`}; do
		bindkey -M $m $c select-quoted
	done
done

# Enable select-bracketed
autoload -U select-bracketed
zle -N select-bracketed
for m in visual viopp; do
	for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
		bindkey -M $m $c select-bracketed
	done
done
