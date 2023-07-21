local wezterm = require 'wezterm';

return {
    color_scheme = "nord",
    font = wezterm.font_with_fallback({
        "FiraCode Nerd Font",
        "Fira Code",
        "Menlo",
    }),
    font_size = 11.0,
    harfbuzz_features = {"ss07", "ss02", "ss03"},
    --window_background_opacity = 0.9,
    keys = {
        -- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
        {key="LeftArrow", mods="OPT", action=wezterm.action{SendString="\x1bb"}},
        -- Make Option-Right equivalent to Alt-f; forward-word
        {key="RightArrow", mods="OPT", action=wezterm.action{SendString="\x1bf"}},
    },
}
