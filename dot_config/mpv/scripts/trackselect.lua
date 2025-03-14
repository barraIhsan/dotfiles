-- Inspired by po5's trackselect, hence the name
-- https://github.com/po5/trackselect/blob/master/trackselect.lua
-- which in turn, is also inspired by siikamiika's dualaudiofix
-- https://github.com/siikamiika/scripts/blob/master/mpv%20scripts/dualaudiofix.lua
--
-- This will select the best japanese audio
-- stereo if possible, and select the best codec
-- flac -> eac3 -> opus -> aac -> mp3
--
-- Also select the best english subttiles
-- avoid "sign" subs (sign and song only, for english audio),
-- with honorifics (e.g. onii-chan, senpai, nee-sama) if possible,
-- and select ass (advanced substation alpha) subtitle if possible

require("mp")

-- return the highest score id
-- if it's a tie, return the first one found
local function highest(rate)
  -- r means result
  local rid, rscore = 1, 0
  for id, score in pairs(rate) do
    if score > rscore then
      rid, rscore = id, score
    end
  end

  return rid
end

local function select()
  -- a and s means audio and s respectively
  local arate = {}
  local srate = {}

  -- list audio codec from best
  local codec = { flac = 5, eac3 = 4, opus = 3, aac = 2, mp3 = 1 }
  -- b means best
  local bcodec = 1
  local bcodec_tid = 1

  local tracklist = mp.get_property_native("track-list")
  for _, track in ipairs(tracklist) do
    -- t means track
    local tid = track["id"]

    -- if there's japan audio
    -- select the best one
    if track["type"] == "audio" then
      if track["lang"] == "ja" or string.match(track["lang"], "jpn?") then
        -- set initial
        arate[tid] = 0

        -- no mono audio please
        if track["demux-channel-count"] < 2 then
          arate[tid] = arate[tid] - 1
        end

        -- select the best codec
        -- if track["codec"] == c and i < bcodec then
        --   arate[tid] = arate[tid] + 1
        -- end
        if codec[track["codec"]] > bcodec then
          bcodec = codec[track["codec"]]
          bcodec_tid = track["id"]
        end
      end
    end

    -- select english sub
    -- avoid "sign" and "s&s"
    -- prioritize "honor" on sub "title"
    -- prioritize ass on sub "codec"
    if track["type"] == "sub" then
      if string.match(track["lang"], "en.?") then
        -- set initial
        srate[tid] = 0
        -- title
        local title = (track["title"] or ""):lower()

        -- avoid "sign" and "s&s"
        if string.match(title, "sign") or string.match(title, "s&s") then
          srate[tid] = srate[tid] - 2
        end
        -- prioritize "honor" or "honour"
        if string.match(title, "honou?r") then
          srate[tid] = srate[tid] + 1
        end
        -- prioritize ass subtitle
        if track["codec"] == "ass" then
          srate[tid] = srate[tid] + 1
        end
      end
    end
  end

  -- give score to the best acodec
  arate[bcodec_tid] = arate[bcodec_tid] + 1

  -- select audio and sub track
  mp.set_property("aid", highest(arate))
  mp.set_property("sid", highest(srate))
end

mp.register_event("file-loaded", select)
