require("mp")
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
-- select ass (advanced substation alpha) subtitle if possible
-- with honorifics (e.g. onii-chan, senpai, nee-sama) if possible,
-- and with a good subtitle provider (e.g. MTBB) if possible,

-- highest to lowest ->
local sprovider = { "mtbb" }

-- return the highest score id
-- if it's a tie, return the first one found
local function set_highest(prop, rate)
  -- r means result
  local rid, rscore
  for id, score in pairs(rate) do
    -- set result to be the first item in table
    rid, rscore = rid or id, rscore or score

    -- find the highest one
    if score > rscore then
      rid, rscore = id, score
    end
  end

  if rid then
    mp.set_property(prop, rid)
  end
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
    if track["type"] == "audio" and track["lang"] then
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
    -- prioritize honorific (e.g. onii-chan, senpai, nee-sama)
    -- prioritize ass sub
    if track["type"] == "sub" and track["lang"] then
      if string.match(track["lang"], "en.?") then
        -- set initial
        srate[tid] = 0
        -- title
        local title = (track["title"] or ""):lower()

        -- avoid "sign" and "s&s"
        if string.match(title, "sign") or string.match(title, "s&s") then
          srate[tid] = srate[tid] - 7
        end

        -- prioritize good provider
        -- you can set it on the `sprovider` variable
        -- on the top of the file
        for i, p in pairs(sprovider) do
          if string.match(title, p) then
            srate[tid] = srate[tid] + (#sprovider - i + 1) / #sprovider
          end
        end

        -- prioritize "honor" or "honour"
        -- don't include "no honorifics" track
        if string.match(title, "honou?r") and not string.match(title, "no%shonou?r") then
          srate[tid] = srate[tid] + 2
        end
        if string.match(title, "no%shonou?r") then
          srate[tid] = srate[tid] - 1.5
        end

        -- prioritize ass subtitle
        if track["codec"] == "ass" then
          srate[tid] = srate[tid] + 4
        end
      end
    end
  end

  -- select audio and sub track
  set_highest("aid", arate)
  set_highest("sid", srate)
end

mp.add_hook("on_preloaded", 50, select)
