require("mp")

-- list of languages that will be cycled
--
-- use "current" to add current track to the cycle list
-- this will be useful if you use something like
-- 1. `slang` or `alang` in your conf
-- 2. my trackselect script
local slang = { "current", "id" }
local alang = { "current", "en" }

-- hold the list of subtitle and audio track to cycle through
local slist, alist = {}, {}
local slistid, alistid = { 1 }, { 1 }

local function get_tracks(lang, track, list)
  for _, value in ipairs(lang) do
    if string.match(track["lang"], value) then
      table.insert(list, track["id"])
    end
  end
end

local function add_current(lang, list, prop)
  if lang[1] == "current" then
    table.insert(list, mp.get_property(prop))
  end
end

local function get_id()
  -- HACK: clear list while waiting
  -- for my trackselect script
  slist, alist = {}, {}

  -- add current id if specified
  add_current(slang, slist, "sid")
  add_current(alang, alist, "aid")

  local tracklist = mp.get_property_native("track-list")
  for _, track in ipairs(tracklist) do
    if track["type"] == "audio" then
      get_tracks(alang, track, alist)
    end
    if track["type"] == "sub" then
      get_tracks(slang, track, slist)
    end
  end

  for key, value in pairs(slist) do
    print("sub", key, value)
  end
  for key, value in pairs(alist) do
    print("audio", key, value)
  end
end

local function cycle(list, index, prop)
  -- HACK: this will prevent the "current" to be
  -- the same as the next entry.
  mp.unobserve_property(get_id)
  if index[1] == #list then
    mp.set_property(prop, list[1])
    index[1] = 1
  else
    mp.set_property(prop, list[index[1] + 1])
    index[1] = index[1] + 1
  end
end

local function cycle_sub()
  cycle(slist, slistid, "sid")
end

local function cycle_audio()
  cycle(alist, alistid, "aid")
end

-- HACK: this will see sid and aid changes
-- from my trackselect script
mp.observe_property("sid", "number", get_id)
mp.observe_property("aid", "number", get_id)

mp.register_event("file-loaded", get_id)
mp.add_key_binding("'", "cycle-sub", cycle_sub)
mp.add_key_binding(";", "cycle-audio", cycle_audio)
