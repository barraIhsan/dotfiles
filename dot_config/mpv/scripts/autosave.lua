require("mp")
-- Inspired by AN3223's auto-save-state
-- https://github.com/AN3223/dotfiles/blob/master/.config/mpv/scripts/auto-save-state.lua
--
-- This script will periodically saves watch later after
-- - 60 second / 1 minute
-- - pausing the file
-- - playing the next file on playlist
-- ONLY IF `save-position-on-quit` and `resume-playback` are true.

if mp.get_property_bool("save-position-on-quit") and mp.get_property_bool("resume-playback") then
  local function save()
    mp.command("write-watch-later-config")
  end

  local timer = mp.add_periodic_timer(60, save)

  local function pause(_, paused)
    if paused then
      save()
      timer:kill()
    else
      timer:resume()
    end
  end

  local function save_file()
    if mp.get_property_number("playlist-pos") ~= 0 then
      save()
    end
  end

  mp.register_event("file-loaded", save_file)
  mp.observe_property("pause", "bool", pause)
end
