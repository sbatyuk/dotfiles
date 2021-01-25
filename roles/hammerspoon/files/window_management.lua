spoon.SpoonInstall:andUse("MiroWindowsManager")

hs.window.animationDuration = 0

local HYPER_KEY = {'cmd', 'alt', 'ctrl', 'shift'}

spoon.MiroWindowsManager:bindHotkeys({
  left          = {HYPER_KEY, "left"    },
  right         = {HYPER_KEY, "right"   },
  up            = {HYPER_KEY, "up"      },
  down          = {HYPER_KEY, "down"    },
  fullscreen    = {HYPER_KEY, "b"       },
})
