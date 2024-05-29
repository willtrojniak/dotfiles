if command -v starship >& /dev/null; then
  # TODO Change between bash and zsh
  eval "$(starship init bash)"
else
  export PS1="\w> \e[35m\]\$ \e[0m\]"
fi
  

