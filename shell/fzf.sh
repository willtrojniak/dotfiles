if command -v fzf 2>&1 >/dev/null 
then
  eval "$(fzf --bash)"
fi

if command -v fd 2>&1 >/dev/null
then
  export FZF_DEFAULT_COMMAND="fd --type f"
fi

