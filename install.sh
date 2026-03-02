#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles-backup/$(date +%Y%m%d_%H%M%S)"

# --- Detect OS ---
detect_os() {
  case "$(uname -s)" in
    Darwin) echo "macos" ;;
    Linux)
      if grep -qi microsoft /proc/version 2>/dev/null; then
        echo "wsl"
      else
        echo "linux"
      fi
      ;;
    *) echo "unknown" ;;
  esac
}

OS="$(detect_os)"
echo "Detected OS: $OS"

# --- Helpers ---
ask() {
  local prompt="$1"
  read -rp "$prompt [y/N] " answer
  [[ "$answer" =~ ^[Yy]$ ]]
}

installed() {
  command -v "$1" &>/dev/null
}

link_file() {
  local src="$1"
  local dest="$2"

  # Create parent directory
  mkdir -p "$(dirname "$dest")"

  # Already correctly linked
  if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
    echo "  ✓ $dest (already linked)"
    return
  fi

  # Back up existing file/symlink
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    mkdir -p "$BACKUP_DIR"
    mv "$dest" "$BACKUP_DIR/$(basename "$dest")"
    echo "  ⤳ backed up $dest → $BACKUP_DIR/"
  fi

  ln -s "$src" "$dest"
  echo "  → $dest"
}

# ============================================================
# Phase 1: Install Dependencies
# ============================================================
echo ""
echo "=== Phase 1: Install Dependencies ==="
echo ""

# Homebrew
if ! installed brew; then
  if ask "Install Homebrew?"; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # Source brew so it's available for the rest of the script
    if [ -f "/opt/homebrew/bin/brew" ]; then
      eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [ -f "/usr/local/bin/brew" ]; then
      eval "$(/usr/local/bin/brew shellenv)"
    elif [ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]; then
      eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    fi
  fi
else
  echo "✓ Homebrew already installed"
fi

# Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  if ask "Install Oh My Zsh?"; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  fi
else
  echo "✓ Oh My Zsh already installed"
fi

# SDKMAN
if [ ! -d "$HOME/.sdkman" ]; then
  if ask "Install SDKMAN?"; then
    curl -s "https://get.sdkman.io" | bash
    source "$HOME/.sdkman/bin/sdkman-init.sh"
    if ask "Install Java 25.0.1-open via SDKMAN?"; then
      sdk install java 25.0.1-open
    fi
  fi
else
  echo "✓ SDKMAN already installed"
fi

# NVM
if [ ! -d "$HOME/.nvm" ]; then
  if ask "Install NVM?"; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
  fi
else
  echo "✓ NVM already installed"
fi

# Neovim
if ! installed nvim; then
  if ask "Install Neovim?"; then
    if installed brew; then
      brew install neovim
    elif [ "$OS" = "linux" ] || [ "$OS" = "wsl" ]; then
      if installed snap; then
        sudo snap install nvim --classic
      else
        echo "  ⚠ No brew or snap found — install Neovim manually"
      fi
    fi
  fi
else
  echo "✓ Neovim already installed"
fi

# Tmux
if ! installed tmux; then
  if ask "Install Tmux?"; then
    if installed brew; then
      brew install tmux
    elif [ "$OS" = "linux" ] || [ "$OS" = "wsl" ]; then
      if installed apt; then
        sudo apt install -y tmux
      else
        echo "  ⚠ No brew or apt found — install Tmux manually"
      fi
    fi
  fi
else
  echo "✓ Tmux already installed"
fi

# ============================================================
# Phase 2: Symlink Configs
# ============================================================
echo ""
echo "=== Phase 2: Symlink Configs ==="
echo ""

# Neovim
echo "Neovim:"
link_file "$DOTFILES_DIR/nvim/init.lua" "$HOME/.config/nvim/init.lua"

# Zsh
echo "Zsh:"
link_file "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
link_file "$DOTFILES_DIR/zsh/.zprofile" "$HOME/.zprofile"

# Git global ignore
echo "Git:"
link_file "$DOTFILES_DIR/git/.gitignore_global" "$HOME/.config/git/ignore"

# Tmux
echo "Tmux:"
link_file "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"

# Claude Code (skip if claude not installed)
if installed claude; then
  echo "Claude Code:"
  link_file "$DOTFILES_DIR/claude/settings.json" "$HOME/.claude/settings.json"
  link_file "$DOTFILES_DIR/claude/plugins/installed_plugins.json" "$HOME/.claude/plugins/installed_plugins.json"
  link_file "$DOTFILES_DIR/claude/plugins/config.json" "$HOME/.claude/plugins/config.json"
  link_file "$DOTFILES_DIR/claude/skills/graphic-realism/SKILL.md" "$HOME/.claude/skills/graphic-realism/SKILL.md"
  link_file "$DOTFILES_DIR/claude/skills/trendy-design-2026/SKILL.md" "$HOME/.claude/skills/trendy-design-2026/SKILL.md"
else
  echo "Claude Code: ⚠ claude command not found — skipping symlinks"
fi

# ============================================================
# Done
# ============================================================
echo ""
if [ -d "$BACKUP_DIR" ]; then
  echo "Backups saved to: $BACKUP_DIR"
fi
echo "Done! Restart your shell or run: source ~/.zshrc"
