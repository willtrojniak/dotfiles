#!/bin/bash

# Originally inspired by on https://github.com/bartekspitza/dotfiles/
# Additional inspiration from 

# Ask Y/N
function ask() {
  prompt="$1"
  default="$2"
  if [ "$default" = "y" ]; then
    options="Y/n"
    default="y"
  else
    options="y/N"
    default="n"
  fi
  read -p "$prompt ($options): " resp
    if [ -z "$resp" ]; then
      response_lc="$default" # empty defaults
    else
      response_lc=$(echo "$resp" | tr '[:upper:]' '[:lower:]') # case insensitive
    fi

    [ "$response_lc" = "y" ]

}

function backup_config_file() {
  now=$(date "+%y_%m_%d_%T")
  cp "${HOME}/.config" "${HOME}/backup_${now}_.config"
}

function backup_config_folder() {
  now=$(date "+%y_%m_%d_%T")
  cp -r "${HOME}/.config" "${HOME}/backup_${now}_.config"
}

if [ -f "${HOME}/.config" ]; then
  echo "A conflicting .config file already exists at ${HOME}/.config!"
  if ask "Backup and remove the .config file?" "y"; then
    backup_config_file
  else
    echo "Failed to symlink .config folders. A conflicting .config file exists." >&2
    exit 1
  fi
elif [ ! -e "${HOME}/.config" ]; then
  echo "Creating .config directory at ${HOME}"
  mkdir "${HOME}/.config"
elif [ -d "${HOME}/.config" ]; then
  echo "A conflicting .config directory already exists at ${HOME}/.config!"
  if ask "Backup the .config directory?" "y"; then
    backup_config_folder
  fi
fi

# Loop through directories in config folder and create symlinks
# TODO Add option to unlink linked directories
echo "Create symlinks for the following folders in .config directory?"
for dir in $(find config -mindepth 1 -maxdepth 1 -type d); do
  if ask "$(basename "$dir")" "n"; then
	  source="$(realpath "$dir")"
	  target="${HOME}/.config/$(basename "$dir")"
	  
    # Remove files or directories at the target location if they exist
    if [ -e "$target" ]; then
		  rm -rf "$target"
	  fi

    # Create the symlink
    ln -s -f "$source" "$target"
  
  fi
done

# Path to shell config file. i.e .bashrc, .zshrc, etc
SH_CONF_FILE=""
if [ $ZSH_VERSION ]; then
  echo "Detected zsh"
  SH_CONF_FILE="${HOME}/.zsh_profile"
elif [ $BASH_VERSION ]; then
  echo "Detected bash"
  SH_CONF_FILE="${HOME}/.bash_profile"
else
  echo "ERROR: Only supports zsh and bash as of right now" >&2
  exit 1
fi


echo "Source the following shell configuration files?"
for file in shell/*.sh; do
  filepath="$(realpath $file)"
  line=". $filepath"
  if (! grep -Fq "$line" $SH_CONF_FILE) && ask "$file" "n"; then
    echo "" >> $SH_CONF_FILE
    echo "if [ -f $filepath ]; then" >> $SH_CONF_FILE
    echo "  $line" >> $SH_CONF_FILE
    echo "fi" >> $SH_CONF_FILE
  fi
done



: '

# Source the files in ./shell/ in shell config file?

# Create symlinks for the following dotfiles?
echo "Create symlinks for the following dotfiles?"
for file in $(find .* -maxdepth 0 -type f -name ".*" ! -name ".DS_Store"); do
  if ask "$file"; then
    ln  -s "$(realpath "$file")" ~/${file}
  fi
done

# Create symlinks for the following directories?
echo "Create symlinks for the following directories?"
for dir in $(find .* -maxdepth 0 -type d ! -name "." ! -name ".." ! -name ".git");do
  if ask "$dir"; then
    ln -s "$(realpath "$dir")" ~/${dir}
  fi
done 
'
