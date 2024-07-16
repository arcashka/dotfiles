#!/bin/sh

# Function to display a message
print_message() {
    echo "======================================"
    echo "$1"
    echo "======================================"
}

# Check if Neovide is already installed
if command -v neovide >/dev/null 2>&1; then
    print_message "Neovide is already installed. Updating..."
    # Navigate to the Neovide directory and pull the latest changes
    if [ -d "$HOME/neovide" ]; then
        cd "$HOME/neovide" || exit
        git pull
    else
        print_message "Neovide directory not found. Cloning the repository."
        git clone https://github.com/neovide/neovide.git "$HOME/neovide"
        cd "$HOME/neovide" || exit
    fi
else
    print_message "Neovide is not installed. Cloning and building Neovide."
    # Clone the Neovide repository if not already installed
    git clone https://github.com/neovide/neovide.git "$HOME/neovide"
    cd "$HOME/neovide" || exit
fi

# Build Neovide
print_message "Building Neovide..."
cargo build --release

# Create a symlink to the binary
sudo ln -sf "$(pwd)/target/release/neovide" /usr/local/bin/neovide

# Create desktop entry for Neovide
print_message "Creating desktop entry..."
sudo tee /usr/share/applications/neovide.desktop <<EOF
[Desktop Entry]
Name=Neovide
Comment=Neovide is a simple and fast nvim GUI
Exec=neovide
Icon=neovide
Terminal=false
Type=Application
Categories=Utility;TextEditor;
StartupWMClass=neovide
EOF

# Download and install Neovide icon
print_message "Installing icon..."
sudo wget -O /usr/share/icons/hicolor/128x128/apps/neovide.png https://raw.githubusercontent.com/neovide/neovide/main/assets/neovide-256x256.png

# Update icon cache
print_message "Updating icon cache..."
sudo gtk-update-icon-cache /usr/share/icons/hicolor

# Add context menu entries for Neovide
print_message "Adding context menu entries..."
sudo mkdir -p /usr/share/nemo/actions
sudo tee /usr/share/nemo/actions/neovide.nemo_action <<EOF
[Nemo Action]
Active=true
Name=Open with Neovide
Exec=neovide %F
Icon-Name=neovide
Extensions=dir;file;
EOF

print_message "Installation and update complete. You can now launch Neovide from the applications menu or use the context menu to open files with Neovide."
