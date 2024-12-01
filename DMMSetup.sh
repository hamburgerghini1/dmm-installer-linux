#!/bin/sh
#Environment
WINEDLLOVERRIDES="mscoree=d;mshtml=d"
export WINEPREFIX=$HOME/.local/share/dmm
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
ICON_PATH=~/.local/share/icons/hicolor/256x256/apps/
EXEC_LINE="Exec=env WINEPREFIX=$WINEPREFIX "
EXEC_LINE+='DOTNET_ROOT="" wine '
EXEC_LINE+='C:\\\\\\\\DivaModManager\\\\\\\\DivaModManager.exe %u'
PATH_LINE="Path=${WINEPREFIX}/drive_c/DivaModManager"
DESKTOP_PATH="$HOME/.local/share/applications"
wine_ver=$(wine --version)
wine_ver=${wine_ver#*-}

#Download Paths
dmm="https://github.com/TekkaGB/DivaModManager/releases/latest/download/DivaModManager.zip"
dotnet6="https://download.visualstudio.microsoft.com/download/pr/f6b6c5dc-e02d-4738-9559-296e938dabcb/b66d365729359df8e8ea131197715076/windowsdesktop-runtime-6.0.36-win-x64.exe"

if [[ $wine_ver < 8.20 ]]
then
    echo "Wine version is unsupported, please upgrade to wine version 8.26 or later. You may need to install wine-staging package."
    exit
fi

#setup Prefix
mkdir $WINEPREFIX
wineboot -u
#cd ${WINEPREFIX}/drive_c/windows/Fonts && for i in /usr/share/fonts/**/*.{ttf,otf}; do ln -s "$i"; done
cd $SCRIPT_DIR
curl -o /tmp/windowsdesktop-runtime-6.0.36-win-x64.exe $dotnet6
if [[ $wine_ver < 9.0 ]]
then
    winetricks -q dotnet48
    winetricks -q dotnet35
    winetricks -q win10
fi
wine /tmp/windowsdesktop-runtime-6.0.36-win-x64.exe /passive
rm /tmp/windowsdesktop-runtime-6.0.36-win-x64.exe
curl -Lso /tmp/DivaModManager.zip $dmm 
unzip /tmp/DivaModManager.zip -d "${WINEPREFIX}/drive_c/DivaModManager"
rm /tmp/DivaModManager.zip 

#Setup desktop icon
cp $SCRIPT_DIR/DivaModManager.png $ICON_PATH/DivaModManager.png
sed -i "s|^Exec=.*|$EXEC_LINE|" $SCRIPT_DIR/DivaModManager.desktop
sed -i "s|^Path=.*|$PATH_LINE|" $SCRIPT_DIR/DivaModManager.desktop

desktop-file-install --dir=$DESKTOP_PATH $SCRIPT_DIR/DivaModManager.desktop
update-desktop-database $DESKTOP_PATH
