#!/bin/bash

# Function to check if a command exists
command_exists() {
	command -v "$1" >/dev/null 2>&1
}

# Function to install Atuin
install_atuin() {
	if command_exists atuin; then
		echo "Atuin is already installed. Skipping installation."
	else
		echo "Installing Atuin..."
		curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
		if [ $? -ne 0 ]; then
			echo "Failed to install Atuin. Exiting script."
			exit 1
		fi
		echo "Atuin installed successfully."
	fi
}

# Main script execution
install_atuin

echo "Atuin installation script completed."
