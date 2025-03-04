#!/bin/sh

# Getting the latest file in the mpv screenshot dir
FILE=$(ls -t $1 | head -n 1)
FULL=$1/$FILE

# Copy that file into clipboard
# On X11 and Wayland
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
  wl-copy <$FULL
else
  xclip -sel c -t image/png -i $FULL
fi

# Add to mpv user.xdg.tags
setfattr -n user.xdg.tags -v mpv $FULL
