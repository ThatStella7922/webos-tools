#!/bin/sh

### webos-tools installer
### v1.0 - ThatStella7922
### https://github.com/ThatStella7922/webos-tools
###
### Tested on LG C1 48" running webOS 6.3.2
### Run on other devices at your own risk!
###


### Function definitions
## Prints information banner about the script
printBanner () {
    echo "webos-tools installer"
    echo "v1.0 - ThatStella7922"
    echo "https://github.com/ThatStella7922/webos-tools"
    echo
    echo "Tested on LG C1 48\" running webOS 6.3.2"
    echo "Run on other devices at your own risk!"
}

## Asks the user for confirmation before proceeding
beginInstallPrompt () {
    read -p "Begin installation? y/n: " yn
    case $yn in
        [Yy]* ) return;;
        * ) echo "Installation aborted."; exit 1;;
    esac
}

## check if already installed
checkInstalled () {
    if [ -d "/home/root/webos-tools" ]; then
        echo "webos-tools appears to already be installed. Installing again will overwrite existing files."
        beginInstallPrompt
    fi
}

## create dirs
createDirs () {
    mkdir -p /home/root/webos-tools
    mkdir -p /home/root/webos-tools/bin
}

## Installs bash
installBash () {
    curl -\#Lo  /home/root/webos-tools/bin/bash https://github.com/polaco1782/linux-static-binaries/raw/master/armv8-aarch64/bash
    chmod +x /home/root/webos-tools/bin/bash
}

installNeofetch () {
    curl -\#Lo /home/root/webos-tools/bin/neofetch https://github.com/dylanaraps/neofetch/raw/master/neofetch
    chmod +x /home/root/webos-tools/bin/neofetch
}

# Add more programs to install here

## Write the start script
writeStartScript () {
    echo "#!/bin/sh" > /home/root/webos-tools.sh
    echo "# Automatically generated webos-tools start script" >> /home/root/webos-tools.sh
    echo "# v1.0 - ThatStella7922" >> /home/root/webos-tools.sh
    echo "# https://github.com/ThatStella7922/webos-tools" >> /home/root/webos-tools.sh
    echo "export PATH=/home/root/webos-tools/bin:$PATH" >> /home/root/webos-tools.sh
    echo "export WEBOS_TOOLS_VERSION=1.0" >> /home/root/webos-tools.sh
    echo "export PS1=\"[webos-tools 1.0 \u@\h:\w] $ \"" >> /home/root/webos-tools.sh
    echo "echo \"Starting webos-tools 1.0 environment...\"" >> /home/root/webos-tools.sh
    echo "/home/root/webos-tools/bin/bash -bash" >> /home/root/webos-tools.sh
    chmod +x /home/root/webos-tools.sh
}

### End function definitions

printBanner
echo
beginInstallPrompt
checkInstalled
echo
createDirs
echo "Created directories"
echo "Will download and install software..."
installBash
installNeofetch
echo "Installed software"
writeStartScript
echo "Created start script, from now on run ./webos-tools.sh to start the environment!"
echo "webos-tools will present a custom prompt when in the environment."
echo "To exit the environment, type exit and you'll be dropped back to the standard webOS shell."
echo
echo "Installation is completed."