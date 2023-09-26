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
wezterm.on('format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local edge_background = '#222436'
    local background = '#2E3440'
    local foreground = '#ECEFF4'

    if tab.is_active then
      background = '#434C5E'
      foreground = '#ECEFF4'
    elseif hover then
      background = '#3B4252'
      foreground = '#ECEFF4'
    end

    local edge_foreground = background

    local title = tab_title(tab)

    local title_len = #title
    local pad_len = math.floor((max_width - title_len) / 2)

    local formatted_title = {
      Text = string.rep(' ', pad_len) .. title .. string.rep(' ', pad_len)
    }
    -- ensure that the titles fit in the available space,
    -- and that we have room for the edges.

    return {
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      { Background = { Color = background } },
      { Foreground = { Color = foreground } }, formatted_title,
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } }
    }
  end)

return {
  font = wezterm.font 'iMWritingMonoS Nerd Font',
  font_size = 18,
  -- dpi = 144.0,
  tab_max_width = 20,
  color_scheme = 'nord',
  colors = {
    tab_bar = {
      -- The color of the inactive tab bar edge/divider
      background = '#2E3440',
      new_tab = { bg_color = '#2E3440', fg_color = '#ECEFF4' }
    }

  },
  window_padding = { left = 0, right = 0, top = 0, bottom = 0 },
  tab_bar_at_bottom = true,
  use_fancy_tab_bar = false
}
