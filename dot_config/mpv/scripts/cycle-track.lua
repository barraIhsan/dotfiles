require("mp")

-- list of languages that will be cycled
-- use current to add current track to the cycle list
local slang = { "id" }
local alang = { "en" }
local current = true

-- first time init
local init = false
-- create sub and audio list
local function create_list(prop)
  return {
    list = {},
    listid = { 1 },
    currentid = { 0 },
    temp = {},
    is_temp = { true },
    prop = prop,
  }
end
local sub, audio = create_list("sub"), create_list("audio")

local function get_tracks(track, type, lang)
  local currentid, temp, list = type["currentid"][1], type["temp"], type["list"]
  if track["id"] == currentid then
    type["is_temp"][1] = false
    return
  end

  for _, value in ipairs(lang) do
    if string.match(track["lang"], value) then
      if type["is_temp"][1] then
        table.insert(temp, track["id"])
      else
        table.insert(list, track["id"])
      end
    end
  end
end

local function add_current()
  if current then
    sub["currentid"][1] = mp.get_property_native("sid")
    audio["currentid"][1] = mp.get_property_native("aid")
    init = true

    -- append current
    table.insert(sub["list"], sub["currentid"][1])
    table.insert(audio["list"], audio["currentid"][1])
  end
end

local function add_temp(list, temp)
  for _, value in ipairs(temp) do
    table.insert(list, value)
  end
end

local function populate_list()
  add_current()

  local tracklist = mp.get_property_native("track-list")
  for _, track in ipairs(tracklist) do
    if track["lang"] then
      if track["type"] == "sub" then
        get_tracks(track, sub, slang)
      end
      if track["type"] == "audio" then
        get_tracks(track, audio, alang)
      end
    end
  end

  -- add the temp
  add_temp(sub["list"], sub["temp"])
  add_temp(audio["list"], audio["temp"])
end

local function cycle(type)
  local list, prop = type["list"], type["prop"]
  if #list > 1 then
    -- increment index and wrap around
    type["listid"][1] = (type["listid"][1] % #list) + 1

    -- osd message
    local lang = mp.get_property("current-tracks/" .. prop .. "/lang")
    local title = mp.get_property("current-tracks/" .. prop .. "/title") or ""
    mp.osd_message(("Changed %s to [%s] %s (#%s)"):format(prop, lang, title, list[type["listid"][1]]))
  end
end

local function cycle_sub()
  if not init then
    populate_list()
  end
  cycle(sub)
end

local function cycle_audio()
  if not init then
    populate_list()
  end
  cycle(audio)
end

mp.add_key_binding("'", "cycle-sub", cycle_sub)
mp.add_key_binding(";", "cycle-audio", cycle_audio)
