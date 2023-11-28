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

# Check if tmux is already installed
if command -v tmux &> /dev/null; then
    if [ "$QUIET" = false ]; then
        echo "tmux is already installed. "
    fi
else
    # Check the package manager and install tmux
    if command -v brew &> /dev/null; then
        if [ "$QUIET" = false ]; then
            echo "Installing tmux using Homebrew..."
        fi
        brew install tmux
    elif command -v apt-get &> /dev/null; then
        if [ "$QUIET" = false ]; then
            echo "Installing tmux using apt-get..."
        fi
        sudo apt-get update
        sudo apt-get install -y tmux
    else
        echo "Error: Unsupported package manager. Please install tmux manually."
        exit 1
    fi

    # Check if the installation was successful
    if [ $? -eq 0 ]; then
        if [ "$QUIET" = false ]; then
            echo "tmux has been successfully installed. "
        fi
    else
        echo "Error: Failed to install tmux. Please install it manually."
        exit 1
    fi
fi

