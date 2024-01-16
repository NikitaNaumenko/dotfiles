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
	local background = "#151515"

	if tab.is_active then
		background = "#bbdfff"
		foreground = "#000000"
	elseif hover then
		background = "#bbdfff"
		foreground = "#000000"
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

	color_scheme = "Jellybeans",
	colors = {
		-- 	background = "#ffffff",
		-- 	foreground = "#1F2328",
		--
		-- 	cursor_bg = "#1F2328",
		-- 	cursor_border = "#1F2328",
		-- 	cursor_fg = "#ffffff",
		--
		-- 	selection_bg = "#bbdfff",
		-- 	selection_fg = "#1F2328",
		--
		-- 	ansi = {
		-- 		"#24292f",
		-- 		"#cf222e",
		-- 		"#116329",
		-- 		"#4d2d00",
		-- 		"#0969da",
		-- 		"#8250df",
		-- 		"#1b7c83",
		-- 		"#6e7781",
		-- 	},
		-- 	brights = {
		-- 		"#57606a",
		-- 		"#a40e26",
		-- 		"#1a7f37",
		-- 		"#633c01",
		-- 		"#218bff",
		-- 		"#a475f9",
		-- 		"#3192aa",
		-- 		"#8c959f",
		-- 	},
		tab_bar = {
			-- The color of the inactive tab bar edge/divider
			background = "#151515",
			new_tab = { bg_color = "#151515", fg_color = "#ffffff" },
		},
	},

	window_padding = { left = 0, right = 0, top = 0, bottom = 0 },
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
}
