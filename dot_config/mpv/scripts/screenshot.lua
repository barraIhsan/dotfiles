require("mp")

local function screenshot(flag)
  return function()
    -- take a screenshot based on the flags
    -- and store the path into a variable
    local filename = mp.command_native({ "screenshot", flag }).filename
    mp.osd_message("Screenshot (" .. flag .. ") taken")

    -- do the following action only if the platform is linux
    -- 1. copy to clipboard using wl-copy or xclip
    -- 2. add xattr to the file ("mpv" tag, where and when the
    -- screenshot was taken in the comment)
    if mp.get_property("platform") == "linux" then
      -- copy to clipboard
      if os.getenv("XDG_SESSION_TYPE") == "wayland" then
        os.execute("wl-copy < " .. filename)
      else
        os.execute("xclip -sel c -t image/png -i " .. filename)
      end

      -- get the media title or filename without extension
      local title = mp.get_property("media-title")
      if title == mp.get_property("filename") then
        title = mp.get_property("filename/no-ext")
      end
      -- get the current position of the file
      -- as HH:MM:SS.mmm
      local pos = mp.get_property_osd("time-pos/full")

      -- assign xattr tag, mpv
      os.execute("setfattr -n user.xdg.tags -v mpv " .. filename)
      -- assign xattr comment, title and position
      os.execute(("setfattr -n user.xdg.comment -v %q %q"):format(title .. " at " .. pos, filename))
    end
  end
end

-- set the same keybind as the default one
mp.add_key_binding("s", "subs", screenshot("subtitles"))
mp.add_key_binding("S", "video", screenshot("video"))
mp.add_key_binding("Ctrl+s", "window", screenshot("window"))
