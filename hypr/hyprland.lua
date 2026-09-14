-- ============================================================
-- HYPRLAND LUA CONFIG
-- Optimized animations + Move/Focus keybinds + Noctalia integration
-- ============================================================

------------------
---- MONITORS ----
------------------
hl.monitor({
    output   = "eDP-1",
    mode     = "1920x1200@165",
    position = "auto",
    scale    = "1.25",
})

------------------
---- PROGRAMS ----
------------------
local terminal    = "foot"
local fileManager = "nemo"
local browser     = "helium-browser"
local editor      = "kate /home/xdenotte/.config/hypr/hyprland.lua"

-------------------
---- AUTOSTART ----
-------------------
hl.on("hyprland.start", function()
hl.exec_cmd("noctalia")
hl.exec_cmd("steam")
hl.exec_cmd("discord")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("STEAM_FORCE_DESKTOPUI_SCALING", "1.25")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("TERMINAL", "foot")

-----------------------
---- LOOK AND FEEL ----
-----------------------
hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 5,
        border_size = 2,
        layout = "dwindle",
    },

    decoration = {
        rounding = 20,
        rounding_power = 2,

        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = 0xee1a1a1a,
        },

        blur = {
            enabled = true,
            size = 3,
            passes = 2,
            vibrancy = 0.1696,
        },
    },

    xwayland = {
        force_zero_scaling = true,
    },

    dwindle = {
        preserve_split = true,
    },

    misc = {
        force_default_wallpaper = 0,
            disable_hyprland_logo   = true,
            vrr                     = 1,
    },
})

---

--------------------
---- ANIMATIONS ----
--------------------

hl.curve("easeOutQuint",   { type = "bezier", points = { {0.22, 1}, {0.36, 1} } })
hl.curve("easeOutCubic",   { type = "bezier", points = { {0.33, 1}, {0.68, 1} } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0}, {0.35, 1} } })
hl.curve("workspaceQuick", { type = "bezier", points = { {0.16, 1}, {0.3, 1} } })

hl.animation({
    leaf    = "global",
    enabled = true,
    speed   = 5,
    bezier  = "easeOutCubic",
})

hl.animation({
    leaf    = "windows",
    enabled = true,
    speed   = 5,
    bezier  = "easeOutQuint",
    style   = "popin 90%",
})

hl.animation({
    leaf    = "windowsOut",
    enabled = true,
    speed   = 4,
    bezier  = "easeOutCubic",
    style   = "popin 90%",
})

hl.animation({
    leaf    = "windowsMove",
    enabled = true,
    speed   = 5,
    bezier  = "easeOutQuint",
})

hl.animation({
    leaf    = "border",
    enabled = true,
    speed   = 4,
    bezier  = "easeOutCubic",
})

hl.animation({
    leaf    = "fade",
    enabled = true,
    speed   = 4,
    bezier  = "easeOutCubic",
})

hl.animation({
    leaf    = "workspaces",
    enabled = true,
    speed   = 6,
    bezier  = "workspaceQuick",
    style   = "slide",
})

hl.animation({
    leaf    = "zoomFactor",
    enabled = true,
    speed   = 6,
    bezier  = "easeOutCubic",
})

---------------
---- INPUT ----
---------------
hl.config({
    input = {
        kb_layout    = "us,ru,ua",
        kb_variant   = "",
        kb_model     = "",
        kb_options   = "grp:alt_shift_toggle",
        kb_rules     = "",

        repeat_rate  = 50,
        repeat_delay = 300,

        follow_mouse  = 1,
        accel_profile = "flat",
        sensitivity   = 0,

        touchpad = {
            tap_to_click = true,
        },
    },
})

---------------------
---- KEYBINDINGS ----
---------------------
local mainMod = "SUPER"

-- APPS
hl.bind(mainMod .. " + Return",    hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + D",         hl.dsp.exec_cmd("noctalia msg panel-toggle launcher"))
hl.bind("ALT + Tab",               hl.dsp.exec_cmd("noctalia msg window-switcher"))
hl.bind(mainMod .. " + A",         hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + B",         hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + K",         hl.dsp.exec_cmd(editor))
hl.bind(mainMod .. " + M",         hl.dsp.exec_cmd("pavucontrol"))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("noctalia msg panel-toggle session"))
hl.bind(mainMod .. " + L",         hl.dsp.exec_cmd("noctalia msg session lock"))
hl.bind(mainMod .. " + X",         hl.dsp.exec_cmd("noctalia msg panel-toggle wallpaper"))

-- WINDOW CONTROLS
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))

-- MOVE WINDOW (Super + Shift + Arrows)
hl.bind(mainMod .. " + SHIFT + Left",  hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + Right", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + Up",    hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + Down",  hl.dsp.window.move({ direction = "d" }))

-- FOCUS WINDOW (Super + Arrows)
hl.bind(mainMod .. " + Left",  hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + Right", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + Up",    hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + Down",  hl.dsp.focus({ direction = "d" }))

-- PSEUDOTILE
hl.bind(mainMod .. " + SHIFT + SPACE", hl.dsp.window.pseudo())

-- WORKSPACES
for i = 1, 9 do
    hl.bind(mainMod .. " + " .. i,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
    end

    -- MOUSE
    hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
    hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

    -- MEDIA & BRIGHTNESS
    hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("noctalia msg volume-up"),     { locked = true, repeating = true })
    hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("noctalia msg volume-down"),   { locked = true, repeating = true })
    hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("noctalia msg volume-mute"),   { locked = true, repeating = true })
    hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("noctalia msg brightness-up"), { locked = true, repeating = true })
    hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("noctalia msg brightness-down"), { locked = true, repeating = true })

    -- SCREENSHOT
    hl.bind("Print", hl.dsp.exec_cmd("noctalia msg screenshot-region"))

    --------------------------------
    ---- WINDOWS AND WORKSPACES ----
    --------------------------------
    hl.window_rule({
        name = "suppress-maximize-events",
        match = { class = ".*" },
        suppress_event = "maximize",
    })

    hl.window_rule({
        name = "floating-picture-in-picture",
        match = { title = "^Картинка в картинке$" },
        float = true,
    })

    hl.window_rule({
        name = "floating-apps",
        match = { class = "hyprland-share-picker" },
        float = true,
    })

    ------------------
    ---- NOCTALIA ----
    ------------------
    require("noctalia").apply_theme()
