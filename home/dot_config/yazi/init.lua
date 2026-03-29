---@diagnostic disable: undefined-global
-- git status on file
require("git"):setup()

-- full border
require("full-border"):setup()

-- show symlink in status bar
-- https://yazi-rs.github.io/docs/tips/#symlink-in-status
Status:children_add(function(self)
	local h = self._current.hovered
	if h and h.link_to then
		return " -> " .. tostring(h.link_to)
	else
		return ""
	end
end, 3300, Status.LEFT)

-- show username and hostname in header
-- https://yazi-rs.github.io/docs/tips#username-hostname-in-header
Header:children_add(function()
	if ya.target_family() ~= "unix" then
		return ""
	end
	return ui.Span(ya.user_name() .. "@" .. ya.host_name() .. ":"):fg("blue")
end, 500, Header.LEFT)
