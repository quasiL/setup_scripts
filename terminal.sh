#!/bin/bash

add_alias() {
    local command="$1"
    local alias_name="$2"
    echo "alias $alias_name='$command'" >> "$HOME/.bashrc"
}

# Add the alias for wttr - weather forecast in Prague
add_alias "curl wttr.in/Prague" "wttr"
add_alias "batcat" "bat"

source "$HOME/.bashrc"
echo "Aliases added successfully.