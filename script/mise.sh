#!/bin/bash

# Function to check if a command exists
command_exists() {
	command -v "$1" >/dev/null 2>&1
}

# Function to install mise
install_mise() {
	if command_exists mise; then
		echo "Mise is already installed. Skipping installation."
	else
		echo "Installing Mise..."
		curl https://mise.run | sh
		if [ $? -ne 0 ]; then
			echo "Failed to install Mise. Exiting script."
			exit 1
		fi
		echo "Mise installed successfully."
	fi
}

# Function to install a language if not already installed
install_language() {
	local lang=$1
	local version=$2
	if mise ls | grep -q "^$lang"; then
		echo "$lang is already installed. Skipping."
	else
		echo "Installing $lang@$version..."
		mise use -g "$lang@$version"
		if [ $? -ne 0 ]; then
			echo "Failed to install $lang@$version. Continuing with the next one."
		else
			echo "$lang@$version installed successfully."
		fi
	fi
}

# Function to install languages using mise
install_languages() {
	declare -A languages=(
		["node"]="lts"
		["bun"]="latest"
		["go"]="latest"
		["java"]="lts"
		["julia"]="latest"
		["lua"]="latest"
		["maven"]="latest"
		["python"]="3.11"
		["ruby"]="latest"
		["usage"]="latest"
	)

	for lang in "${!languages[@]}"; do
		install_language "$lang" "${languages[$lang]}"
	done
}

# Main script execution
install_mise
install_languages

echo "All installations completed."
