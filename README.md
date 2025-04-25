# mpv config for Windows

This is my mpv config for Windows and it has many QOL scripts out of the box. It uses [uosc](https://github.com/tomasklaen/uosc) by default for the ui.

## Install external scripts and shaders

I wrote the script in `.sh` shell script that can be executed in \*nix system like Mac and GNU/Linux. Fortunately, you can run shell script by using Git Bash or the other similar approach (e.g MSYS2 or Cygwin)

To use Git Bash:

1. Install `git` if you haven't installed it yet. You can install it manually (using setup exe's), or you can use package manager like `choco` (`choco install git`), `winget` and (`winget install git`).
2. Once that installed, you should be able to run the `install.sh` script with Git bash (try searching it on the `Open with` dialog)

If you didn't have `mpv` installed, you can follow these instruction:

## Install `mpv` on Windows

There are many ways to install mpv in Windows, but I suggest using either these two

### 1. Windows build by shinchiro

It provides mpv build for the latest commit and also provide a install batch script to associate file extension to allow you to play video/audio files with mpv using the `Open with` prompt. It also provides a start menu shortcut for mpv so you can easily open it using the start menu.

To install:

1. Visit the [repo's release page](https://github.com/shinchiro/mpv-winbuild-cmake/releases)
2. Expand the `Assets` and you can click on the `Show all assets` to show all the assets
3. Download the file based on your architechture, if you didn't know what that is, just download the file starting with `x86_64-v3` because you probably use `x86_64`
4. Extract the file and you can put it wherever you want as long as you won't delete it. In my case, I extract the file to `C:\Program Files\mpv`
5. Go to the extracted folder and navigate into the `installer` folder/directory
6. Run the `mpv-install.bat` script as an admin (right click on the file and click `Run as administrator`)
7. Wait till it's done and you can close the cmd
8. To play the file, you can right click the file and find `mpv` on the `Open with` dialog. If for some reason it's not there, you can find it upon clicking the `Choose another app`

To update:

1. Run the `updater.bat` script

### 2. Chocolatey

More or less the same as the first option, but mpv will be managed by chocolatey (package manager) instead.

To install:

1. Install chocolatey if you haven't installed it yet. On newer version on windows you can install it by typing `winget install --id chocolatey.chocolatey --source winget` on cmd
2. With chocolatey installed, you can now easily install mpv by typing `choco install mpv` with admin (Open cmd as admin) and when asked if you want to run the script, you can type `A` and press enter
3. Wait till it's done and you can close the cmd
4. To play the file, you can right click the file and find `mpv` on the `Open with` dialog. If for some reason it's not there, you can find it upon clicking the `Choose another app`

To update:

1. Type `choco upgrade mpv` on cmd

## Install `ffmpeg` on Windows

On newer version on windows, you can install it simply by typing `winget install --id chocolatey.chocolatey --source winget` on cmd,  
or you can also install it using chocolatey if you have them installed, simply type `choco install ffmpeg` on cmd
