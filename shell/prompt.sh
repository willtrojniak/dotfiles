if command -v starship >& /dev/null; then
  # TODO Change between bash and zsh
  if [ -f "$HOME/.config/starship/starship.toml" ]; then
    STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
  fi
  eval "$(starship init bash)"
else
  export PS1="\w> \e[35m\]\$ \e[0m\]"
fi
  

