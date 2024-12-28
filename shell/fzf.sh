eval "$(fzf --bash)"

if command -v fd 2>&1 >/dev/null
then
  export FZF_DEFAULT_COMMAND="fd --type f"
fi

