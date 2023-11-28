#!/bin/zsh

QUIET=false

# Process command line options
while getopts ":q" opt; do
    case $opt in
        q)
            QUIET=true
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            exit 1
            ;;
    esac
done

# Check if fzf is already installed
if command -v fzf &> /dev/null; then
    if [ "$QUIET" = false ]; then
        echo "fzf is already installed. "
    fi
else
    # Check the package manager and install fzf
    if command -v brew &> /dev/null; then
        echo "Installing fzf using Homebrew..."
        brew install fzf
    elif command -v apt-get &> /dev/null; then
        echo "Installing fzf using apt-get..."
        sudo apt-get update
        sudo apt-get install -y fzf
    else
        echo "Error: Unsupported package manager. Please install fzf manually."
        exit 1
    fi

    # Check if the installation was successful
    if [ $? -eq 0 ]; then
        echo "fzf has been successfully installed. "
    else
        echo "Error: Failed to install fzf. Please install it manually."
        exit 1
    fi
fi

