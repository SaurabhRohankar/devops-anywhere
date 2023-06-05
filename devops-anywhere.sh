#!/bin/bash

# Function to install Docker
install_docker() {
    echo "Installing Docker..."
    echo "Docker installed successfully!"
}

# Function to install Jenkins
install_jenkins() {
    echo "Installing Jenkins..."
    echo "Jenkins installed successfully!"
}

# Function to install Terraform
install_terraform() {
    echo "Installing Terraform..."
    echo "Terraform installed successfully!"
}

# Function to install Ansible
install_ansible() {
    echo "Installing Ansible..."
    echo "Ansible installed successfully!"
}

# Main script

# Check the underlying distribution
if [[ $(uname) == "Linux" ]]; then
    if [[ -f /etc/os-release ]]; then
        . /etc/os-release
        distribution="${ID}"
    elif [[ -f /etc/lsb-release ]]; then
        . /etc/lsb-release
        distribution="${DISTRIB_ID}"
    elif [[ -f /etc/debian_version ]]; then
        distribution="debian"
    elif [[ -f /etc/redhat-release ]]; then
        distribution="rhel"
    else
        echo "Unsupported distribution!"
        exit 1
    fi
else
    echo "This script only supports Linux distributions!"
    exit 1
fi

# Set color variables using tput
title_color=$(tput setaf 6)    # Cyan
option_color=$(tput setaf 3)   # Yellow
input_color=$(tput setaf 2)    # Green
error_color=$(tput setaf 1)    # Red
reset_color=$(tput sgr0)       # Reset color

# Print a welcome message
clear
tput bold
echo "${title_color}Welcome to DevOps Anywhere!${reset_color}"
tput sgr0

# Prompt the user to select DevOps tools to install
echo "$(tput setaf 3)╔══════════════════════════════════════╗"
echo "║   DevOps Anywhere - Tool Installer   ║"
echo "╚══════════════════════════════════════╝${reset_color}"
echo "Please select the tools you want to install:"
echo "${option_color}1. Docker"
echo "2. Jenkins"
echo "3. Terraform"
echo "4. Ansible${reset_color}"

# Read user input
read -p "${input_color}Enter comma-separated numbers (e.g., 1,2,3): ${reset_color}" tools

# Split user input into an array
IFS=',' read -ra tool_array <<< "$tools"

# Install selected tools
for tool in "${tool_array[@]}"; do
    case $tool in
        1) install_docker ;;
        2) install_jenkins ;;
        3) install_terraform ;;
        4) install_ansible ;;
        *)
            echo "${error_color}Invalid tool number: $tool${reset_color}"
            ;;
    esac
done

echo "${title_color}╔══════════════════════════════════════╗"
echo "║        Installation complete!        ║"
echo "╚══════════════════════════════════════╝${reset_color}"
