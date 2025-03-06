require("mp")

local function title()
  local pl_index = mp.get_property("playlist-current-pos")
  local pl_title = mp.get_property("playlist/" .. pl_index .. "/title")

  -- Title metadata on a file (e.g. mkv) will
  -- be prioritized by default on mpv over playlist
  -- title.
  --
  -- But sometimes the title sucks so I made
  -- a playlist file for that.
  --
  -- Force media title to be the playlist title
  -- only if it have a playlist title
  if pl_title ~= nil then
    mp.set_property("force-media-title", pl_title)
  end
end

mp.register_event("file-loaded", title)
