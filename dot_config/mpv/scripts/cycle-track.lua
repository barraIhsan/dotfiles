require("mp")

-- list of languages that will be cycled
-- use current to add current track to the cycle list
local slang = { "id" }
local alang = { "en" }
local current = true

-- hold the list of subtitle and audio track to cycle through
local slist, alist = {}, {}
local slistid, alistid = { 1 }, { 1 }
local currentid = { 0, 0 }
local init = false

local function get_tracks(lang, track, list)
  for _, value in ipairs(lang) do
    if string.match(track["lang"], value) then
      table.insert(list, track["id"])
    end
  end
end

local function add_current()
  if current then
    currentid[1] = mp.get_property_native("sid")
    currentid[2] = mp.get_property_native("aid")
    init = true

    -- append current
    table.insert(slist, currentid[1])
    table.insert(alist, currentid[2])
  end
end

local function populate_list()
  add_current()

  local tracklist = mp.get_property_native("track-list")
  for _, track in ipairs(tracklist) do
    if track["lang"] then
      if track["type"] == "sub" and track["id"] ~= currentid[1] then
        get_tracks(slang, track, slist)
      end
      if track["type"] == "audio" and track["id"] ~= currentid[2] then
        get_tracks(alang, track, alist)
      end
    end
  end
end

local function cycle(list, index, prop)
  if #list > 1 then
    if index[1] == #list then
      mp.set_property(prop, list[1])
      index[1] = 1
    else
      mp.set_property(prop, list[index[1] + 1])
      index[1] = index[1] + 1
    end

    -- osd message
    local type = (prop == "sid") and "sub" or "audio"
    local lang = mp.get_property("current-tracks/" .. type .. "/lang")
    local title = mp.get_property("current-tracks/" .. type .. "/title") or ""
    mp.osd_message(("Changed %s to [%s] %s (#%s)"):format(type, lang, title, list[index[1]]))
  end
end

local function cycle_sub()
  if not init then
    populate_list()
  end
  cycle(slist, slistid, "sid")
end

local function cycle_audio()
  if not init then
    populate_list()
  end
  cycle(alist, alistid, "aid")
end

mp.add_key_binding("'", "cycle-sub", cycle_sub)
mp.add_key_binding(";", "cycle-audio", cycle_audio)
