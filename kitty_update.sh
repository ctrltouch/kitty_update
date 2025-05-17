#!/bin/bash
set -e

KITTY_DIR="$HOME/.local/kitty.app"
KITTY_BIN="$HOME/.local/bin/kitty"

echo "🦊 Downloading latest Kitty..."
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

echo "🔗 Setting up symlink..."
mkdir -p ~/.local/bin
ln -sf "$KITTY_DIR/bin/kitty" "$KITTY_BIN"

echo "📄 Updating desktop entry..."
cp "$KITTY_DIR/share/applications/kitty.desktop" ~/.local/share/applications/

# Fix icon and exec path
sed -i "s|Icon=kitty|Icon=$KITTY_DIR/share/icons/hicolor/256x256/apps/kitty.png|" ~/.local/share/applications/kitty.desktop
sed -i "s|Exec=kitty|Exec=$KITTY_BIN|" ~/.local/share/applications/kitty.desktop

echo "✅ Kitty updated to version: $($KITTY_BIN --version)"
