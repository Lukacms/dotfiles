local function run(keys, cmd)
  hl.bind(keys, hl.dsp.exec_cmd(cmd))
end

hl.unbind("SUPER + P")
hl.unbind("SUPER + SHIFT + P")
hl.unbind("SUPER + SHIFT + S")
hl.unbind("SUPER + TAB")

-- Apps
run("SUPER + P", "rofi -show run")
run("SUPER + SHIFT + P", "rofi -show drun")
run("SUPER + Return", "kitty ~")
run("SUPER + SHIFT + Return", "popterm bash -c '...'") -- paste your full fzf line from sxhkdrc
run("SUPER + A", "popterm bash")
run("SUPER + W", "firefox")
run("SUPER + SHIFT + W", "firefox --private-window")
run("SUPER + SHIFT + S", "popterm snips")
run("CTRL + SPACE", "swaync-client --close-all") -- HyDE uses swaync, not dunst

-- Floating toggle
hl.bind("SUPER + SHIFT + SPACE", hl.dsp.window.float({ action = "toggle" }))

-- Focus / move with h j k l
local dirs = { H = "left", J = "down", K = "up", L = "right" }
for key, dir in pairs(dirs) do
  hl.bind("SUPER + " .. key, hl.dsp.focus({ direction = dir }))
  hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ direction = dir }))
end
-- Cycle workspaces
hl.bind("SUPER + TAB", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + SHIFT + TAB", hl.dsp.focus({ workspace = "e-1" }))

hl.bind("SUPER + M", hl.dsp.submap("music"))
hl.define_submap("music", "reset", function()
  hl.bind("h", hl.dsp.exec_cmd("playerctl -p firefox previous"))
  hl.bind("Return", hl.dsp.exec_cmd("playerctl -p firefox play-pause"))
  hl.bind("l", hl.dsp.exec_cmd("playerctl -p firefox next"))
  hl.bind("Escape", hl.dsp.submap("reset"))
  hl.bind("catchall", hl.dsp.submap("reset"))
end)

hl.bind("SUPER + Escape", hl.dsp.submap("power"))
hl.define_submap("power", "reset", function()
  hl.bind("l", hl.dsp.exec_cmd("hyprlock"))
  hl.bind("e", hl.dsp.exec_cmd("uwsm stop"))
  hl.bind("s", hl.dsp.exec_cmd("systemctl suspend"))
  hl.bind("r", hl.dsp.exec_cmd("systemctl reboot"))
  hl.bind("SHIFT + s", hl.dsp.exec_cmd("systemctl poweroff"))
  hl.bind("Escape", hl.dsp.submap("reset"))
  hl.bind("catchall", hl.dsp.submap("reset"))
end)

-- misc stuff
hl.config({
  input = {
    repeat_delay = 200,
    repeat_rate = 50,
    kb_layout = "us,fr",
    kb_variant = "altgr-intl,",
    kb_options = "grp:alt_shift_toggle",
  },
})
