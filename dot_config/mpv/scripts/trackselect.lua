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
  local codec = { _count = 5, flac = 5, eac3 = 4, opus = 3, aac = 2, mp3 = 1 }

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

        -- no mono audio please and add score
        -- if it has more than 2 channel (surround)
        arate[tid] = arate[tid] + (track["demux-channel-count"] - 2)

        -- prioritize best codec
        -- use decimal point 0.x
        arate[tid] = arate[tid] + (1 + (codec[track["codec"]] or -1) / codec["_count"])

        -- prioritize highest sample rate when multiple track have the best codec
        -- use decimal point after codec 0.0xxx
        -- 1e7 here because the highest samplerate is 384000
        arate[tid] = arate[tid] + (track["demux-samplerate"] / 1e7)

        -- NOTE: There should be an audio bitrate comparison here by trying
        -- audio track one-by-one, and check `audio-bitrate` property.
        -- But sometimes audio can have a variable bitrate, so we can't
        -- just rely on it. Why we can't just use `demux-bitrate` you
        -- might say? It's usually unavailable
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
          srate[tid] = srate[tid] - 3
        end
        -- prioritize "honor" or "honour"
        if string.match(title, "honou?r") then
          srate[tid] = srate[tid] + 1
        end
        -- prioritize ass subtitle
        if track["codec"] == "ass" then
          srate[tid] = srate[tid] + 2
        end
      end
    end
  end

  -- select audio and sub track
  mp.set_property("aid", highest(arate))
  mp.set_property("sid", highest(srate))
end

mp.register_event("file-loaded", select)
