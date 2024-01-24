local wezterm = require("wezterm")

-- The filled in variant of the > symbol
function tab_title(tab_info)
	local title = tab_info.tab_title
	-- if the tab title is explicitly set, take that
	if title and #title > 0 then
		return title
	end
	-- Otherwise, use the title from the active pane
	-- in that tab
	return tab_info.active_pane.title
end

-- local user_var_tab_title_key = 'tab_title';
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local edge_background = "#151515"
	local foreground = "#ffffff"
	local background = "#1a1b26"

	if tab.is_active then
		background = "#292e42"
		foreground = "#ffffff"
	elseif hover then
		background = "#1a1b26"
		foreground = "#ffffff"
	end

	local edge_foreground = background

	local title = tab_title(tab)

	local title_len = #title
	local pad_len = math.floor((max_width - title_len) / 2)

	local formatted_title = { Text = string.rep(" ", pad_len) .. title .. string.rep(" ", pad_len) }
	-- ensure that the titles fit in the available space,
	-- and that we have room for the edges.

	return {
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		formatted_title,
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
	}
end)

return {
	font = wezterm.font("Zed Mono"),
	font_size = 18,
	dpi = 144.0,
	tab_max_width = 20,
	force_reverse_video_cursor = true,

	color_scheme = "tokyonight_night",
	colors = {
		tab_bar = {
			background = "#1a1b26",
			new_tab = { bg_color = "#1a1b26", fg_color = "#ffffff" },
		},
	},

	window_padding = { left = 0, right = 0, top = 0, bottom = 0 },
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
}
