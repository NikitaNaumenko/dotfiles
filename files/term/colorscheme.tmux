#!/usr/bin/env bash
#===============================================================================
#   Author: NaumenkoNikita
#    Email: naumenkoniki@gmail.com
#  Created: 2022-11-12 19:38
#===============================================================================

# Options
right_arrow_icon=$(tmux_get '@tmux_power_right_arrow_icon' '')
left_arrow_icon=$(tmux_get '@tmux_power_left_arrow_icon' '')
upload_speed_icon=$(tmux_get '@tmux_power_upload_speed_icon' '')
download_speed_icon=$(tmux_get '@tmux_power_download_speed_icon' '')
session_icon="$(tmux_get '@tmux_power_session_icon' '')"
user_icon="$(tmux_get '@tmux_power_user_icon' '')"
time_icon="$(tmux_get '@tmux_power_time_icon' '')"
date_icon="$(tmux_get '@tmux_power_date_icon' '')"
show_upload_speed="$(tmux_get @tmux_power_show_upload_speed false)"
show_download_speed="$(tmux_get @tmux_power_show_download_speed false)"
show_web_reachable="$(tmux_get @tmux_power_show_web_reachable false)"
prefix_highlight_pos=$(tmux_get @tmux_power_prefix_highlight_pos)
time_format=$(tmux_get @tmux_power_time_format '%T')
date_format=$(tmux_get @tmux_power_date_format '%F')
dark="#24292f"
white="#f6f8fa"

blue='#0969da'
light_blue='#d5e5f6'


right_sep=''
left_sep=''
left_sep_thin=''
right_sep_thin=''

tmux set-option status-style fg="${dark}",bg="${white}"
tmux set-option interval 1
tmux set-option status on

# Window separator
tmux set-window-option -g window-status-separator ""

# Left status
tmux set-option -g status-left "#[bg=${white},fg=${dark}] ﬦ #[bg=${white},fg=${white}]${right_sep}"

# Other inactive
tmux set-window-option -g window-status-format "#[bg=${light_blue},fg=${white},bold]${right_sep}#[bg=${light_blue},fg=${dark}] #I #[bg=${light_blue}, fg=${white}]${left_sep_thin}#[bg=${light_blue},fg=${dark}] #W #F #[bg=${white},fg=${light_blue},bold]${right_sep}"

# Current window
 tmux set-window-option -g window-status-current-format "#[bg=${blue},fg=${white},bold]${right_sep}#[bg=${blue},fg=${white}] #I ${left_sep_thin}#[bg=${blue},fg=${white}] #W #F #[bg=${white},fg=${blue},bold]${right_sep}"

# Right status
tmux set-option -g status-right "#[bg=${white},fg=${blue}]${left_sep}#[bg=${blue},fg=${white}] %H:%M ${right_sep_thin} %m/%d/%Y #[bg=${blue},fg=${white}]${right_sep_thin}#[bg=${blue},fg=${white}]"
# short for Theme-Colour
# TC='#0969da'
  # -- Terminal Colors
  #   orange = '#d18616',
  #   black = '#24292e',
  #   bright_black = '#959da5',
  #   white = '#6a737d',
  #   bright_white = '#d1d5da',
  #   red = '#d73a49',
  #   bright_red = '#cb2431',
  #   green = '#28a745',
  #   bright_green = '#22863a',
  #   yellow = '#dbab09',
  #   bright_yellow = '#b08800',
  #   blue = '#0366d6',
  #   bright_blue = '#005cc5',
  #   magenta = '#5a32a3',
  #   bright_magenta = '#5a32a3',
  #   cyan = '#0598bc',
  #   bright_cyan = '#3192aa',
  # #     -- foreground colors
  #   fg = '#24292f',
  #   fg_dark = '#666666',
  #   fg_gutter = '#babbbd',
  #   fg_light = '#586069',
  #   fg_term = '#24292f',

  #   -- Background Highlights Colors
  #   bg_highlight = '#d5e5f6',
  #   bg_search = '#fff2be',
  #   bg_visual = '#e1e4e8',
  #   bg_visual_selection = '#dbe9f9',
  #   border = '#044289',

  #   -- Cursor & LineNumber Colors
  #   cursor = '#044289',
  #   cursor_line_nr = '#24292e',
  #   line_nr = '#babbbd',
  #
}

main

# vim: set filetype=bash
