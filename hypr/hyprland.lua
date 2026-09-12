-- ============================================================
-- HYPRLAND LUA CONFIG
-- NIRI-STYLE HORIZONTAL SCROLLING
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


---------------------
---- MY PROGRAMS ----
---------------------

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
        gaps_in     = 5,
        gaps_out    = 5,
        border_size = 2,

        col = {
            active_border = {
                colors = {
                    "rgba(33ccffee)",
          "rgba(00ff99ee)"
                },
                angle = 45,
            },

            inactive_border = "rgba(595959aa)",
        },

        resize_on_border = false,
        allow_tearing    = false,

        -- Niri-style horizontal window tape
        layout = "scrolling",
    },

    decoration = {
        rounding       = 10,
        rounding_power = 2,

        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = true,
          size      = 3,
          passes    = 1,
          vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})


---------------------------
---- SCROLLING LAYOUT ----
---------------------------

hl.config({
    scrolling = {
        -- One column fills the whole monitor
        fullscreen_on_one_column = true,

        -- Default width of each column
        -- 1.0 = one full screen
        column_width = 1.0,

        -- 0 = center focused column
        focus_fit_method = 0,

        -- Automatically move the tape to focused window
        follow_focus = true,

        -- Focus follows once at least 40% is visible
        follow_min_visible = 0.4,

        -- Do not wrap first -> last
        wrap_focus = false,

        -- Do not wrap when swapping columns
        wrap_swapcol = false,

        -- Horizontal tape
        direction = "right",

        -- Width presets for colresize +conf / -conf
        explicit_column_widths = "0.333, 0.5, 0.667, 1.0",
    },
})


-----------------------
---- XWAYLAND ----
-----------------------

hl.config({
    xwayland = {
        force_zero_scaling = true,
    },
})


-----------------------
---- ANIMATIONS ----
-----------------------

hl.curve(
    "easeOutQuint",
    {
        type = "bezier",
        points = {
            {0.23, 1},
            {0.32, 1},
        },
    }
)

hl.curve(
    "easeInOutCubic",
    {
        type = "bezier",
        points = {
            {0.65, 0.05},
            {0.36, 1},
        },
    }
)

hl.curve(
    "linear",
    {
        type = "bezier",
        points = {
            {0, 0},
            {1, 1},
        },
    }
)

hl.curve(
    "almostLinear",
    {
        type = "bezier",
        points = {
            {0.5, 0.5},
            {0.75, 1},
        },
    }
)

hl.curve(
    "quick",
    {
        type = "bezier",
        points = {
            {0.15, 0},
            {0.1, 1},
        },
    }
)

hl.curve(
    "easy",
    {
        type = "spring",
        mass = 1,
        stiffness = 238.1191,
        dampening = 24.21279333,
    }
)


hl.animation({
    leaf = "global",
    enabled = true,
    speed = 10,
    bezier = "default",
})

hl.animation({
    leaf = "border",
    enabled = true,
    speed = 5.39,
    bezier = "easeOutQuint",
})

hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 4.79,
    spring = "easy",
})

hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 4.1,
    spring = "easy",
    style = "popin 87%",
})

hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 1.49,
    bezier = "linear",
    style = "popin 87%",
})

hl.animation({
    leaf = "fadeIn",
    enabled = true,
    speed = 1.73,
    bezier = "almostLinear",
})

hl.animation({
    leaf = "fadeOut",
    enabled = true,
    speed = 1.46,
    bezier = "almostLinear",
})

hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 3.03,
    bezier = "quick",
})

hl.animation({
    leaf = "layers",
    enabled = true,
    speed = 3.81,
    bezier = "easeOutQuint",
})

hl.animation({
    leaf = "layersIn",
    enabled = true,
    speed = 4,
    bezier = "easeOutQuint",
    style = "fade",
})

hl.animation({
    leaf = "layersOut",
    enabled = true,
    speed = 1.5,
    bezier = "linear",
    style = "fade",
})

hl.animation({
    leaf = "fadeLayersIn",
    enabled = true,
    speed = 1.79,
    bezier = "almostLinear",
})

hl.animation({
    leaf = "fadeLayersOut",
    enabled = true,
    speed = 1.39,
    bezier = "almostLinear",
})

hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 1.94,
    bezier = "almostLinear",
    style = "fade",
})

hl.animation({
    leaf = "workspacesIn",
    enabled = true,
    speed = 1.21,
    bezier = "almostLinear",
    style = "fade",
})

hl.animation({
    leaf = "workspacesOut",
    enabled = true,
    speed = 1.94,
    bezier = "almostLinear",
    style = "fade",
})

hl.animation({
    leaf = "zoomFactor",
    enabled = true,
    speed = 7,
    bezier = "quick",
})


----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo   = true,
        vrr = 1,
    },
})


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us,ru,ua",
        kb_variant = "",
        kb_model   = "",

        kb_options = "grp:alt_shift_toggle",
        kb_rules   = "",

        repeat_rate  = 50,
        repeat_delay = 300,

        follow_mouse = 0,
        accel_profile = "flat",
        sensitivity  = 0,

        touchpad = {
            natural_scroll = true,
            tap_to_click   = true,
        },
    },
})


-----------------------
---- TOUCHPAD GESTURE
-----------------------

-- 3-finger horizontal swipe = workspace switch
hl.gesture({
    fingers   = 3,
    direction = "horizontal",
    action    = "workspace",
})


---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"


----------------------------
---- APPLICATIONS ----------
----------------------------

hl.bind(
    mainMod .. " + Q",
    hl.dsp.window.close()
)

hl.bind(
    mainMod .. " + Return",
    hl.dsp.exec_cmd(terminal)
)

hl.bind(
    mainMod .. " + D",
    hl.dsp.exec_cmd("noctalia msg panel-toggle launcher")
)

hl.bind(
    mainMod .. " + M",
    hl.dsp.exec_cmd("pavucontrol")
)

hl.bind(
    mainMod .. " + SHIFT + B",
    hl.dsp.exec_cmd(browser)
)

hl.bind(
    mainMod .. " + SHIFT + Q",
    hl.dsp.exec_cmd("noctalia msg panel-toggle session")
)

hl.bind(
    mainMod .. " + P",
    hl.dsp.exec_cmd("dms ipc call notepad toggle")
)

hl.bind(
    mainMod .. " + A",
    hl.dsp.exec_cmd(fileManager)
)

hl.bind(
    mainMod .. " + L",
    hl.dsp.exec_cmd("noctalia msg session lock")
)

hl.bind(
    mainMod .. " + K",
    hl.dsp.exec_cmd(editor)
)

hl.bind(
    mainMod .. " + X",
    hl.dsp.exec_cmd("noctalia msg panel-toggle wallpaper")
)


------------------------
---- WINDOW STATE -------
------------------------

hl.bind(
    mainMod .. " + V",
    hl.dsp.window.float({
        action = "toggle",
    })
)

hl.bind(
    mainMod .. " + SHIFT + F",
    hl.dsp.window.fullscreen()
)

-- Kept from your original config
hl.bind(
    mainMod .. " + J",
    hl.dsp.layout("togglesplit")
)


--------------------------------------
---- SCROLLING WINDOW NAVIGATION ----
--------------------------------------

-- Previous window in the horizontal tape
hl.bind(
    mainMod .. " + left",
    hl.dsp.layout("focus l")
)

-- Next window in the horizontal tape
hl.bind(
    mainMod .. " + right",
    hl.dsp.layout("focus r")
)


---------------------------------
---- SCROLLING WINDOW REORDER ----
---------------------------------

-- Move current column left
hl.bind(
    mainMod .. " + CTRL + left",
    hl.dsp.layout("swapcol l")
)

-- Move current column right
hl.bind(
    mainMod .. " + CTRL + right",
    hl.dsp.layout("swapcol r")
)


---------------------------------
---- MANUAL TAPE MOVEMENT -------
---------------------------------

-- Move the layout by one column
hl.bind(
    mainMod .. " + ALT + left",
    hl.dsp.layout("move -col")
)

hl.bind(
    mainMod .. " + ALT + right",
    hl.dsp.layout("move +col")
)


---------------------------------
---- CENTER / FIT CURRENT -------
---------------------------------

-- Fit current column completely into view
hl.bind(
    mainMod .. " + SPACE",
    hl.dsp.layout("fit_into_view")
)

-- Explicitly center current column
hl.bind(
    mainMod .. " + SHIFT + SPACE",
    hl.dsp.layout("center")
)


---------------------------------
---- COLUMN WIDTH --------------
---------------------------------

-- Cycle to previous configured width
hl.bind(
    mainMod .. " + CTRL + SHIFT + left",
    hl.dsp.layout("colresize -conf")
)

-- Cycle to next configured width
hl.bind(
    mainMod .. " + CTRL + SHIFT + right",
    hl.dsp.layout("colresize +conf")
)


---------------------------------
---- WORKSPACES 1-9 ------------
---------------------------------

for i = 1, 9 do

    hl.bind(
        mainMod .. " + " .. i,
        hl.dsp.focus({
            workspace = i,
        })
    )

    hl.bind(
        mainMod .. " + SHIFT + " .. i,
        hl.dsp.window.move({
            workspace = i,
        })
    )

    end


    ---------------------
    ---- MOUSE BINDS ----
    ---------------------

    hl.bind(
        mainMod .. " + mouse:272",
        hl.dsp.window.drag(),
            {
                mouse = true,
            }
    )

    hl.bind(
        mainMod .. " + mouse:273",
        hl.dsp.window.resize(),
            {
                mouse = true,
            }
    )


    ----------------------------------
    ---- MEDIA & BRIGHTNESS ---------
    ----------------------------------

    hl.bind(
        "XF86AudioRaiseVolume",
        hl.dsp.exec_cmd("noctalia msg volume-up"),
            {
                locked = true,
                repeating = true,
            }
    )

    hl.bind(
        "XF86AudioLowerVolume",
        hl.dsp.exec_cmd("noctalia msg volume-down"),
            {
                locked = true,
                repeating = true,
            }
    )

    hl.bind(
        "XF86AudioMute",
        hl.dsp.exec_cmd("noctalia msg volume-mute"),
            {
                locked = true,
                repeating = true,
            }
    )

    hl.bind(
        "XF86MonBrightnessUp",
        hl.dsp.exec_cmd("noctalia msg brightness-up"),
            {
                locked = true,
                repeating = true,
            }
    )

    hl.bind(
        "XF86MonBrightnessDown",
        hl.dsp.exec_cmd("noctalia msg brightness-down"),
            {
                locked = true,
                repeating = true,
            }
    )


    --------------------
    ---- SCREENSHOTS ----
    --------------------

    hl.bind(
        "Print",
        hl.dsp.exec_cmd("noctalia msg screenshot-region")
    )

    --------------------------------
    ---- WINDOWS AND WORKSPACES ----
    --------------------------------


    -------------------------------
    ---- SUPPRESS MAXIMIZE --------
    -------------------------------

    hl.window_rule({
        name = "suppress-maximize-events",

        match = {
            class = ".*",
        },

        suppress_event = "maximize",
    })


    -------------------------------
    ---- PICTURE IN PICTURE --------
    -------------------------------

    hl.window_rule({
        name = "floating-picture-in-picture",

        match = {
            title = "^Картинка в картинке$",
        },

        float = true,
    })


    --------------------------
    ---- FLOATING APPS -------
    --------------------------

    hl.window_rule({
        name = "floating-apps",

        match = {
            class = "hyprland-share-picker",
        },

        float = true,
    })

-- For Noctalia Color templates
require("noctalia").apply_theme()
