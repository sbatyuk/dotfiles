require('spoon_manager')
require('reload_configuration')
require('hammerspoon_preferences')
require('window_management')
require('quit_fantastical')

hs.notify.new({informativeText='Successfully loaded', withdrawAfter=1.25}):send()
