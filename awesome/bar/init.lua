local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local helper = require("helper")
local awful = require("awful")
local pallete = require("theme.pallete")
local batterywidget = require("battery-widget")({ battery_prefix = "" })

-- Table of layouts to cover with awful.layout.inc, order matters.
---@diagnostic disable-next-line: undefined-global
tag.connect_signal(
  "request::default_layouts",
  function()
    awful.layout.append_default_layouts({
      awful.layout.suit.tile,
      awful.layout.suit.floating,
    })
  end
)

--      ────────────────────────────────────────────────────────────

local volume = require("bar.modules.volume")
local layout = require("bar.modules.layoutbox")
local date = require("bar.modules.date")
local time = require("bar.modules.time")
local systray = require("bar.modules.systray")
local taglist = require("bar.modules.taglist")
local tasklist = require("bar.modules.tasklist")
local button = require("bar.modules.button")
local redshift = require("bar.modules.redshift")

--      ────────────────────────────────────────────────────────────

---@diagnostic disable-next-line: undefined-global
screen.connect_signal("request::desktop_decoration", function(s)
  awful.tag({ " ", " ", " ", " ", " ", " " }, s, awful.layout.layouts[1])

  s.calendar = require("bar.modules.calendar").setup(s)
  s.dashboard = require("bar.modules.button.dashboard").setup(s)

  s.mywibox = awful.wibar({
    position = "top",
    screen = s,
    height = dpi(32),
    widget = {
      layout = wibox.layout.align.horizontal,
      expand = "none",
      {
        -- Left widgets
        layout = wibox.layout.fixed.horizontal,
        layout(s),
        taglist(s),
        tasklist(s),
      },
      {
        -- Middle widget
        layout = wibox.layout.flex.horizontal,
        redshift,
      },
      {
        -- Right widgets
        layout = wibox.layout.fixed.horizontal,
        systray,
        volume,
        date,
        time,
        batterywidget,
        button,
      },
    },
  })
end)
