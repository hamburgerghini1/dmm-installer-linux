# Diva Mod Manager Installer for Linux

## Dependencies

### Steam Deck and Immutable Distros
Use the immutable script instead.  
Make sure AppImageLauncher is not installed.

### Arch
```
curl
wine
winetricks
unzip
desktop-file-utils
lib32-gnutls
lib32-gst-plugins-base
```
Install your dependencies with the following
```
sudo pacman -S curl wine winetricks p7zip unzip desktop-file-utils lib32-gnutls lib32-gst-plugins-base
```
If wine is "missing" from the repositories, open /etc/pacman.conf in your favorite editor and uncomment the two multilib (not multililb testing lines!) close to the endo f the file.  

### Debian and similar
```
curl
wine
winetricks
unzip
desktop-file-utils
gnutls
```

Install
```
sudo apt install curl wine winetricks p7zip unzip desktop-file-utils gnutls
```

### Fedora
```
curl
wine
winetricks
unzip
desktop-file-utils
gnutls
gnutls.i686
```
Install
```
sudo dnf install curl wine winetricks p7zip unzip desktop-file-utils gnutls gnutls.i686
```

Make sure you have these installed before trying to run the script otherwise you will run into issues.

## Immutable Installation
Clone the repo or click code then Download zip.  
Run `./DMMSetupImmutable.sh` in your terminal.  
Once completed, open your desktop's launcher and start Diva Mod Manager.  
Once it opens, click launch through steam and it will automatically detect your install path.

## Installation
Make sure you have git installed if you want it super easy!  
```bash
git clone https://github.com/alexankitty/aemulus-installer-linux
cd dmm-installer-linux
./DMMSetup.sh
```
Once done, open your desktop's launcher and run "Diva Mod Manager"  
Once it opens, click launch through steam and it will automatically detect your install path.