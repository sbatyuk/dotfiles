local original_window = hs.window.frontmostWindow()

hs.application.launchOrFocus('TickTick')
hs.window.focusedWindow():close()

original_window:focus()
