#!/bin/bash

# Define possible virtual environment names or paths
VENV_NAMES=("venv" "env" ".venv")

# Function to activate the virtual environment
activate_venv() {
    local venv_path=$1
    if [ -f "$venv_path/bin/activate" ]; then
        echo "Activating virtual environment at $venv_path"
        source "$venv_path/bin/activate"
        return 0
    else
        echo "No activate script found at $venv_path"
        return 1
    fi
}

# Search for the virtual environment in the current directory
for venv_name in "${VENV_NAMES[@]}"; do
    if [ -d "$venv_name" ]; then
        if activate_venv "$venv_name"; then
            exit 0
        fi
    fi
done

# If no virtual environment was found
echo "No virtual environment found."
exit 1