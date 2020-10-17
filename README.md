# V IUP
A V wrapper for the IUP "UI"

# Setup

1. Download the appropriate runtime libraries for your Operating system: https://sourceforge.net/projects/iup/files/3.30/
2. For Windows, copy iup.dll to app directory to build

## Linux install

1. Extract runtime libraries to a folder
2. Run `sudo ./install` to install libraries


### Windows App Manifest

To update manifest:

`cd winmanifest`
`windres -i resources.rc -o manifest.syso -O coff`

Copy manifest.syso to ./examples