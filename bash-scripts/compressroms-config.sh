#!/bin/bash

# Set the file path
FILE="/media/games/scripts/compressroms-variables.txt"

# Check if the first argument is "help"
if [[ "$1" == "help" ]]; then
    echo "No option detected."
    exit 1
fi

if [[ "$1" == "" ]]; then
    echo "Do "compressroms-config help""
    exit 1
fi
# Check if the config file exists
if [[ ! -f "$FILE" ]]; then
    echo "Config file not found!"
    exit 1
fi

# Check if a third argument is passed, this is to detect unquoted paths with spaces
if [ -n "$3" ]; then
    echo "Too many arguments! Use doble quotes quotes for path"
    exit 0
fi


# ---------- CHECK FOR VALID ARGUMENT --------------------------- 

# Define an array of valid options for the first argument
valid_options=(
        "gamecube_input"
        "wii_input"
        "ps2_input"
        "gamecube_output"
        "wii_output"
        "ps2_output"
)

# Check if the first argument is in the array of valid options
if [[ ! " ${valid_options[@]} " =~ " $1 " ]]; then
    echo "Invalid option. Valid options are: ${valid_options[@]}"
    exit 1
fi




# Get the variable name and value from the command line arguments
VAR_NAME="$1"
VAR_VALUE="$2"

# Update the variable in the file
sed -i "s@^$VAR_NAME=.*@$VAR_NAME="$VAR_VALUE"@" "$FILE"        # sed doesnt give  a ____ about quotes and paths. Using @ as delimiter solves this