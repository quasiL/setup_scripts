#!/bin/bash

# VSCodium settings file
settings_file="$HOME/.config/VSCodium/User/settings.json"

# Setup VSCodium repository and install it with extensions
install_vscodium() {
    echo "Updating package information and upgrading existing packages..."
    sudo apt update && sudo apt upgrade -y

    echo "Adding VSCodium repository key..."
    wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | gpg --dearmor | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg

    echo "Adding VSCodium repository to sources..."
    echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' | sudo tee /etc/apt/sources.list.d/vscodium.list

    echo "Updating package information after adding the repository..."
    sudo apt update

    echo "Installing VSCodium..."
    sudo apt install codium

    echo "Installing VSCodium extensions..."
    codium --install-extension devsense.phptools-vscode mehedidracula.php-namespace-resolver rokoroku.vscode-theme-darcula

    echo "Installation completed successfully."
}

# Install JetBrains fonts
install_fonts() {
    local zip_url="https://download.jetbrains.com/fonts/JetBrainsMono-2.304.zip"
    local temp_dir="/tmp/JetBrainsMono"

    echo "Downloading JetBrains Mono font..."
    wget -qO "$temp_dir.zip" "$zip_url"

    echo "Extracting fonts..."
    unzip -q "$temp_dir.zip" -d "$temp_dir"

    echo "Installing fonts..."
    sudo cp "$temp_dir"/*.ttf /usr/share/fonts/truetype/

    echo "Cleaning up temporary files..."
    rm -rf "$temp_dir" "$temp_dir.zip"
}

# Modify a VS Codium setting
modify_vscodium_setting() {
    local setting_name="$1"
    local setting_value="$2"

    # Check if the settings file exists
    if [ -f "$settings_file" ]; then
        # Check if the setting is already present
        if grep -q "\"$setting_name\"" "$settings_file"; then
            # Setting exists, update its value
            sed -i "s/\"$setting_name\":.*$/\"$setting_name\": $setting_value,/" "$settings_file"
        else
            # Setting does not exist, add it
            echo -e "\n\"$setting_name\": $setting_value," >> "$settings_file"
        fi
        echo "Setting '$setting_name' modified successfully."
    else
        echo "Error: VSCodium settings file not found."
    fi
}

install_vscodium

install_fonts

modify_vscodium_setting "editor.formatOnPaste" true
modify_vscodium_setting "editor.formatOnSave" true
modify_vscodium_setting "editor.fontSize" 13
modify_vscodium_setting "editor.fontLigatures" false
modify_vscodium_setting "editor.fontFamily" "\"JetBrains Mono\""
modify_vscodium_setting "editor.fontWeight" "\"300\""
modify_vscodium_setting "editor.letterSpacing" 1.2
modify_vscodium_setting "editor.lineHeight" 22
modify_vscodium_setting "workbench.colorTheme" "\"Darcula\""
modify_vscodium_setting "editor.rulers" "[120]"
modify_vscodium_setting "extensions.ignoreRecommendations" true
