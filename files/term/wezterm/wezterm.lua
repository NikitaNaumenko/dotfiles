local wezterm = require 'wezterm'

-- The filled in variant of the > symbol
function tab_title(tab_info)
    local title = tab_info.tab_title
    -- if the tab title is explicitly set, take that
    if title and #title > 0 then return title end
    -- Otherwise, use the title from the active pane
    -- in that tab
    return tab_info.active_pane.title
end

-- local user_var_tab_title_key = 'tab_title';
wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
    local edge_background = '#222436'
    local background = '#1f1f28'
    local foreground = '#dcd7ba'

    if tab.is_active then
        background = '#292936'
        foreground = '#c8c093'
    elseif hover then
        background = '#292936'
        foreground = '#c8c093'
    end

    local edge_foreground = background

    local title = tab_title(tab)

    local title_len = #title
    local pad_len = math.floor((max_width - title_len) / 2)

    local formatted_title = {Text = string.rep(' ', pad_len) .. title .. string.rep(' ', pad_len)}
    -- ensure that the titles fit in the available space,
    -- and that we have room for the edges.

    return {
        {Background = {Color = edge_background}},
        {Foreground = {Color = edge_foreground}},
        {Background = {Color = background}},
        {Foreground = {Color = foreground}},
        formatted_title,
        {Background = {Color = edge_background}},
        {Foreground = {Color = edge_foreground}}
    }
end)

return {
    font = wezterm.font 'Zed Mono',
    font_size = 18,
    -- dpi = 144.0,
    tab_max_width = 20,
    color_scheme = 'nord',
    force_reverse_video_cursor = true,
    colors = {
        foreground = "#dcd7ba",
        background = "#1f1f28",

        cursor_bg = "#c8c093",
        cursor_fg = "#c8c093",
        cursor_border = "#c8c093",

        selection_fg = "#c8c093",
        selection_bg = "#2d4f67",

        scrollbar_thumb = "#16161d",
        split = "#16161d",

        ansi = {"#090618", "#c34043", "#76946a", "#c0a36e", "#7e9cd8", "#957fb8", "#6a9589", "#c8c093"},
        brights = {"#727169", "#e82424", "#98bb6c", "#e6c384", "#7fb4ca", "#938aa9", "#7aa89f", "#dcd7ba"},
        indexed = {[16] = "#ffa066", [17] = "#ff5d62"},
      tab_bar = {
        -- The color of the inactive tab bar edge/divider
        background = '#1f1f28',
        new_tab = { bg_color = '#1f1f28', fg_color = '#dcd7ba' }
      }


    },
    window_padding = {left = 0, right = 0, top = 0, bottom = 0},
    tab_bar_at_bottom = true,
    use_fancy_tab_bar = false
}
