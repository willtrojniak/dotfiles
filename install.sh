#!/bin/bash

# Based on https://github.com/bartekspitza/dotfiles/

# Ask Y/n
function ask() {
  read -p "$1 (Y/n): " resp
    if [ -z "$resp" ]; then
      response_lc="y" # empty defaults to "y"
    else
      response_lc=$(echo "$resp" | tr '[:upper:]' '[:lower:]') # case insensitive
    fi

    [ "$response_lc" = "y" ]

}

# Check what shell is being used
SH="${HOME}/.bashrc"
ZSHRC="${HOME}/.zshrc"
if [ -f "$ZSHRC" ]; then
	SH="$ZSHRC"
fi

echo >> $SH # Create .bashrc or .zshrc

# Source the files in ./shell/ in shell config file?
echo "Source the following shell configuration files?"
for file in shell/*.sh; do
  if ask "$file"; then
    echo "source $(realpath "$file")" >> $SH
  fi
done

# Create symlinks for the following dotfiles?
echo "Create symlinks for the following dotfiles?"
for file in $(find .* -maxdepth 0 -type f -name '.*' ! -name '.DS_Store'); do
  if ask "$file"; then
    ln -s "$(realpath "$file")" ~/${file}
  fi
done

# Create symlinks for the following directories?
echo "Create symlinks for the following directories?"
for dir in $(find .* -maxdepth 0 -type d ! -name '.' ! -name '..' ! -name '.git');do
  if ask "$dir"; then
    ln -s "$(realpath "$dir")" ~/${dir}
  fi
done
