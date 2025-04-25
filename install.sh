# ansi
GREEN='\033[0;32m'
RED='\033[0;31m'
RESET='\033[0m'

# unarchive using either 7z or unzip
if command -v 7z &>/dev/null; then
  echo -e "Using ${GREEN}7z${RESET} to unarchive file"
  archiver=7z
elif command -v unzip &>/dev/null; then
  echo -e "Using ${GREEN}unzip${RESET} to unarchive file"
  archiver=unzip
else
  echo -e "${RED}Error${RESET}: Neither unzip nor 7z found."
  exit 1
fi

unarchive() {
  echo -e "Unarchiving ${GREEN}$1${RESET}"
  if [ $archiver == "unzip" ]; then
    if [ "$3" == "*" ]; then
      unzip -o "$2" -d "$4" >/dev/null
    else
      unzip -o "$2" "$3" -d "$4" >/dev/null
    fi
  elif [ $archiver == "7z" ]; then
    7z -y x "$2" "$3" -o"$4" >/dev/null
  fi
  rm $2
}

download() {
  echo -e "Downloading ${GREEN}$1${RESET}"
  curl -LSs $2 -o $3
}

## mpv shaders
# anime4k shaders
download "Anime4K Shaders" "https://github.com/Tama47/Anime4K/releases/latest/download/GLSL_Windows_High-end.zip" anime4k.zip
unarchive "Anime4K Shaders" anime4k.zip "shaders/**" .

# fsr shaders
download "FSR Shaders" "https://gist.githubusercontent.com/agyild/82219c545228d70c5604f865ce0b0ce5/raw/FSR.glsl" shaders/FSR.glsl

## mpv fonts
# gandhi sans for sub
download "Gandhi Sans Font" "https://www.fontsquirrel.com/fonts/download/gandhi-sans" gandhi-sans.zip
unarchive "Gandhi Sans Font" gandhi-sans.zip "*.otf" fonts

## mpv scripts
# uosc
download "uosc" "https://github.com/tomasklaen/uosc/releases/latest/download/uosc.zip" uosc.zip
unarchive "uosc" uosc.zip "*" .

# sponsorblock
download "SponsorBlock" "https://codeberg.org/jouni/mpv_sponsorblock_minimal/raw/master/sponsorblock_minimal.lua" scripts/sponsorblock_minimal.lua

# ani-skip, skip anime opening and ending
download "ani-skip" "https://raw.githubusercontent.com/synacktraa/ani-skip/master/skip.lua" scripts/ani-skip.lua

# videoclip
rm -rf scripts/videoclip
download "videoclip" "https://github.com/Ajatt-Tools/videoclip/archive/refs/heads/master.zip" scripts/videoclip.zip
unarchive "videoclip" scripts/videoclip.zip "**/*.lua" scripts
mv scripts/videoclip-master scripts/videoclip

# seek to a specific timestamp
download "seek-to" "https://raw.githubusercontent.com/occivink/mpv-scripts/master/scripts/seek-to.lua" scripts/seek-to.lua

# image thumbnail
download "thumbfast" "https://raw.githubusercontent.com/po5/thumbfast/master/thumbfast.lua" scripts/thumbfast.lua

# audio visualizer
download "visualizer" "https://raw.githubusercontent.com/mfcc64/mpv-scripts/master/visualizer.lua" scripts/visualizer.lua
