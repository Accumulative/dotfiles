local awful = require("awful.init")
local hotkeys_popup = require("awful.hotkeys_popup")

local modkey = "Mod4"
local terminal = "alacritty"

awful.mouse.append_global_mousebindings({
    awful.button({}, 3, function() end),
})

-- General Awesome keys
awful.keyboard.append_global_keybindings({
    awful.key({ modkey }, "F1", hotkeys_popup.show_help, { description = "show help", group = "awesome" }),
    awful.key({ modkey, "Shift" }, "r", awesome.restart, { description = "reload awesome", group = "awesome" }),
    awful.key({}, "Print", function() awful.util.spawn("shutter --select -e") end),

    awful.key(
        { modkey },
        "Return",
        function() awful.spawn(terminal) end,
        { description = "open a terminal", group = "launcher" }
    ),

    awful.key(
        { "Mod1" },
        "space",
        function() awful.spawn("rofi -show drun") end,
        { description = "Rofi", group = "launcher" }
    ),
    awful.key(
        {},
        "XF86AudioLowerVolume",
        function() awful.spawn.with_shell("pactl set-sink-volume @DEFAULT_SINK@ -5%") end
    ),

    awful.key(
        {},
        "XF86AudioRaiseVolume",
        function() awful.spawn.with_shell("pactl set-sink-volume @DEFAULT_SINK@ +5%") end
    ),
    awful.key({}, "XF86AudioMute", function() awful.spawn.with_shell("pactl set-sink-volume @DEFAULT_SINK@ 0%") end),
    awful.key({}, "XF86MonBrightnessUp", function() awful.spawn.with_shell("brightnessctl set +10%") end),
    awful.key({}, "XF86MonBrightnessDown", function() awful.spawn.with_shell("brightnessctl set 10%-") end),
    awful.key(
        { modkey, "Control" },
        "j",
        function() awful.screen.focus_relative(1) end,
        { description = "focus the next screen", group = "screen" }
    ),

    awful.key(
        { modkey, "Control" },
        "k",
        function() awful.screen.focus_relative(-1) end,
        { description = "focus the previous screen", group = "screen" }
    ),
    -- Prompt
    awful.key(
        { modkey },
        "r",
        function() awful.screen.focused().mypromptbox:run() end,
        { description = "run prompt", group = "launcher" }
    ),

    awful.key(
        { modkey },
        "x",
        function()
            awful.prompt.run({
                prompt = "Run Lua code: ",
                textbox = awful.screen.focused().mypromptbox.widget,
                exe_callback = awful.util.eval,
                history_path = awful.util.get_cache_dir() .. "/history_eval",
            })
        end,
        { description = "lua execute prompt", group = "awesome" }
    ),
})

-- Tags related keybindings
awful.keyboard.append_global_keybindings({
    awful.key({ modkey, "Shift" }, "Tab", awful.tag.viewprev, { description = "view previous", group = "tag" }),
    awful.key({ modkey }, "Tab", awful.tag.viewnext, { description = "view next", group = "tag" }),
})

-- Focus related keybindings
awful.keyboard.append_global_keybindings({
    awful.key(
        { modkey },
        "j",
        function() awful.client.focus.bydirection("down", client.focused) end,
        { description = "focus by direction down", group = "client" }
    ),

    awful.key(
        { modkey },
        "k",
        function() awful.client.focus.bydirection("up", client.focused) end,
        { description = "focus by direction up", group = "client" }
    ),

    awful.key(
        { modkey },
        "h",
        function() awful.client.focus.bydirection("left", client.focused) end,
        { description = "focus by direction left", group = "client" }
    ),

    awful.key(
        { modkey },
        "l",
        function() awful.client.focus.bydirection("right", client.focused) end,
        { description = "focus by direction down", group = "client" }
    ),
})

-- Layout related keybindings
awful.keyboard.append_global_keybindings({
    awful.key(
        { modkey, "Shift" },
        "j",
        function() awful.client.swap.bydirection("down", client.focused) end,
        { description = "swap by direction down", group = "client" }
    ),

    awful.key(
        { modkey, "Shift" },
        "k",
        function() awful.client.swap.bydirection("up", client.focused) end,
        { description = "swap by direction up", group = "client" }
    ),

    awful.key(
        { modkey, "Shift" },
        "h",
        function() awful.client.swap.bydirection("left", client.focused) end,
        { description = "swap by direction left", group = "client" }
    ),

    awful.key(
        { modkey, "Shift" },
        "l",
        function() awful.client.swap.bydirection("right", client.focused) end,
        { description = "swap by direction right", group = "client" }
    ),

    awful.key({ modkey }, "u", awful.client.urgent.jumpto, { description = "jump to urgent client", group = "client" }),
    awful.key(
        { modkey },
        "space",
        function() awful.layout.inc(1) end,
        { description = "select next", group = "layout" }
    ),

    awful.key(
        { modkey, "Shift" },
        "space",
        function() awful.layout.inc(-1) end,
        { description = "select previous", group = "layout" }
    ),

    awful.key(
        { modkey, "Control" },
        "k",
        function() awful.client.incwfact(-0.05) end,
        { description = "Resize by direction up", group = "client" }
    ),

    awful.key(
        { modkey, "Control" },
        "j",
        function() awful.client.incwfact(0.05) end,
        { description = "Resize by direction down", group = "client" }
    ),

    awful.key(
        { modkey, "Control" },
        "h",
        function() awful.tag.incmwfact(-0.05) end,
        { description = "Resize by direction left", group = "client" }
    ),

    awful.key(
        { modkey, "Control" },
        "l",
        function() awful.tag.incmwfact(0.05) end,
        { description = "Resize by direction right", group = "client" }
    ),
})

awful.keyboard.append_global_keybindings({
    awful.key({
        modifiers = { modkey },
        keygroup = "numrow",
        description = "only view tag",
        group = "tag",
        on_press = function(index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then tag:view_only() end
        end,
    }),
    awful.key({
        modifiers = { modkey, "Control" },
        keygroup = "numrow",
        description = "toggle tag",
        group = "tag",
        on_press = function(index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then awful.tag.viewtoggle(tag) end
        end,
    }),
    awful.key({
        modifiers = { modkey, "Shift" },
        keygroup = "numrow",
        description = "move focused client to tag",
        group = "tag",
        on_press = function(index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then client.focus:move_to_tag(tag) end
            end
        end,
    }),
})

--      ────────────────────────────────────────────────────────────

client.connect_signal("request::default_mousebindings", function()
    awful.mouse.append_client_mousebindings({
        awful.button({}, 1, function(c) c:activate({ context = "mouse_click" }) end),
        awful.button({ modkey }, 1, function(c) c:activate({ context = "mouse_click", action = "mouse_move" }) end),
        awful.button({ modkey }, 3, function(c) c:activate({ context = "mouse_click", action = "mouse_resize" }) end),
    })
end)

client.connect_signal("request::default_keybindings", function()
    awful.keyboard.append_client_keybindings({
        awful.key({ modkey }, "f", function(c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end, { description = "toggle fullscreen", group = "client" }),
        awful.key({ modkey }, "q", function(c) c:kill() end, { description = "close", group = "client" }),
        awful.key({ modkey }, "t", awful.client.floating.toggle, { description = "toggle floating", group = "client" }),
        awful.key(
            { modkey },
            "t",
            function(c) c.ontop = not c.ontop end,
            { description = "toggle keep on top", group = "client" }
        ),

        awful.key(
            { modkey, "Control", "Shift" },
            "k",
            function(c) c:move_to_screen(c.screen.index - 1) end,
            { description = "move to screen left", group = "client" }
        ),

        awful.key(
            { modkey, "Control", "Shift" },
            "j",
            function(c) c:move_to_screen(c.screen.index + 1) end,
            { description = "move to screen right", group = "client" }
        ),
    })
end)
