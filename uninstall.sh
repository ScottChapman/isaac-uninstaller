#!/bin/bash
if [ -d ~/Library/Preferences/Velocomp/iBike\ 2 ]; then
    if [ -d ~/Library/Preferences/Velocomp/iBike\ 2.save ]; then
        rm -rf ~/Library/Preferences/Velocomp/iBike\ 2.save
    fi
    mv ~/Library/Preferences/Velocomp/iBike\ 2{,.save}
fi
echo "Files located in ~/Library/Preferences/Velocomp"
ls -l ~/Library/Preferences/Velocomp
sudo launchctl remove nilxid
declare -a files=(
"/Applications/Isaac for Mac.app"
"/Applications/National Instruments/NI-VISA"
"/Library/Application Support/National Instruments"
"/Library/Preferences/NIvisa"
"/Library/Frameworks/VISA.Framework"
"/Library/LaunchDaemons/nilxid.plist"
"/Library/Extensions/NiViPciK.kext"
)
for file in "${files[@]}"
do
    if [ ! -e "$file" ]; then
        echo "$file does not exist"
    else
        if [ -f "$file" ]; then
            echo "$file is a file."
        elif [ -d "$file" ]; then
            echo "$file is a directory."
        fi
        sudo rm -rf "$file"
    fi
done

# Section for uninstalling and removing packages (optional)
# declare -a pkgs=(
# "com.ni.pkg.nivisaruntime"
# "com.ni.NI-VISA_Runtime.LibAppSupp.pkg"
# "com.ni.NI-VISA_Runtime.LibExt.pkg"
# "com.ni.NI-VISA_Runtime.LibPrefs.pkg"
# "com.ni.NI-VISA_Runtime.App.pkg"
# "com.ni.NI-VISA_Runtime.LibLaunchd.pkg"
# "com.ni.pkg.nivisadevelopment"
# "com.ni.NI-VISA_DevSupp.LibPrefs.pkg"
# "com.ni.NI-VISA_DevSupp.LibAppSupp.pkg"
# "com.ni.pkg.nivisaconfiguration"
# "com.ni.pkg.nivisaserver"
# )
# for pkg in "${pkgs[@]}"
# do
    # #files
    # for file in `pkgutil --only-files --files $pkg`
    # do
        # echo "Should remove file $file"
    # done
    # #directories
    # for dir in `pkgutil --only-dirs --files $pkg`
    # do
        # echo "Should remove directory $dir"
    # done
    # echo "forget $pkg"
# done
