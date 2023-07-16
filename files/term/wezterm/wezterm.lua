local wezterm = require 'wezterm'
local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_left_half_circle_thick
-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_right_half_circle_thick
function tab_title(tab_info)
  local title = tab_info.tab_title
  -- if the tab title is explicitly set, take that
  if title and #title > 0 then return title end
  -- Otherwise, use the title from the active pane
  -- in that tab
  return tab_info.active_pane.title
end

-- local user_var_tab_title_key = 'tab_title';
wezterm.on('format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local edge_background = '#f7f7f7'
    local background = '#f7f7f7'
    local foreground = '#000000'

    if tab.is_active then
      background = '#000000'
      foreground = '#f7f7f7'
    elseif hover then
      background = '#5c5c5c'
      foreground = '#f7f7f7'
    end

    local edge_foreground = background

    local title = tab_title(tab)

    -- ensure that the titles fit in the available space,
    -- and that we have room for the edges.
    title = wezterm.truncate_right(title, max_width - 2)

    return {
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } }, { Text = SOLID_LEFT_ARROW },
      { Background = { Color = background } },
      { Foreground = { Color = foreground } }, { Text = title },
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } }, { Text = SOLID_RIGHT_ARROW }
    }
  end)

return {
  font = wezterm.font 'JetBrains Mono',
  font_size = 18,
  -- dpi = 144.0,
  tab_max_width = 8,
  color_scheme = 'Alabaster',
  colors = {
    tab_bar = {
      -- The color of the inactive tab bar edge/divider
      background = '#f7f7f7',
      new_tab = { bg_color = '#f7f7f7', fg_color = '#000000' }
    }

  },
  window_padding = { left = 2, right = 0, top = 0, bottom = 0 },
  tab_bar_at_bottom = true,
  use_fancy_tab_bar = false
}
