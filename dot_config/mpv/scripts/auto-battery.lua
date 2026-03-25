require("mp")
-- This script switches to the "battery" profile
-- when the laptop is unplugged (only at mpv startup)
--
local options = {
  profile = "battery",
  battery = "BAT0",
}

require("mp.options").read_options(options, "auto-battery")

local file = io.open("/sys/class/power_supply/" .. options.battery .. "/status", "r")

if not file then
  mp.msg.error("Cannot found battery " .. options.battery)
  return nil
end

local status = file:read()

if status == "Discharging" then
  mp.commandv("apply-profile", options.profile)
end
