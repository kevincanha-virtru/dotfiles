#!/bin/bash
set -e

echo "Bootstrapping terminal setup..."

# Install Homebrew
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Install chezmoi
if ! command -v chezmoi &>/dev/null; then
  brew install chezmoi
fi

# Apply dotfiles
chezmoi init --apply kcanha/dotfiles
