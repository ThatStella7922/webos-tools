#!/bin/sh

### webos-tools uninstaller
### v1.0 - ThatStella7922
### https://github.com/ThatStella7922/webos-tools
###
### Tested on LG C1 48" running webOS 6.3.2
### Run on other devices at your own risk!
###


### Function definitions
## Prints information banner about the script
printBanner () {
    echo "webos-tools uninstaller"
    echo "v1.0 - ThatStella7922"
    echo "https://github.com/ThatStella7922/webos-tools"
    echo
    echo "Tested on LG C1 48\" running webOS 6.3.2"
    echo "Run on other devices at your own risk!"
}

## Asks the user for confirmation before proceeding
beginUninstallPrompt () {
    read -p "Begin uninstallation? y/n: " yn
    case $yn in
        [Yy]* ) return;;
        * ) echo "Unnstallation aborted."; exit 1;;
    esac
}

## Remove dirs
removeDirs () {
    rm -rf /home/root/webos-tools
}


## Remove the start script
rmStartScript () {
    rm /home/root/webos-tools.sh
}

### End function definitions

printBanner
echo
beginUninstallPrompt
echo
removeDirs
echo "webos-tools directories removed."
rmStartScript
echo "webos-tools uninstalled."