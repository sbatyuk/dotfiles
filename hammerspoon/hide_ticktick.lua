local original_window = hs.window.frontmostWindow()

hs.application.launchOrFocus('TickTick')
hs.window.focusedWindow():close()

if original_window then original_window:focus() end
