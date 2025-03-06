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

			-- xattr mpv tag
			os.execute("setfattr -n user.xdg.tags -v mpv " .. filename)
			-- xattr where and when comment
			local title = mp.get_property("media-title")
			local pos = mp.get_property("time-pos")
			os.execute(("setfattr -n user.xdg.comment -v '%s at %s' %s"):format(title, pos, filename))
		end
	end
end

-- set the same keybind as the default one
mp.add_key_binding("s", "subs", screenshot("subtitles"))
mp.add_key_binding("S", "video", screenshot("video"))
mp.add_key_binding("Ctrl+s", "window", screenshot("window"))
