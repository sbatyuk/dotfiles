require('spoon_manager')
require('reload_configuration')
require('hammerspoon_preferences')
require('window_management')
require('quit_fantastical')
require('prevent_sleep')

hs.notify.new({informativeText='Successfully loaded', withdrawAfter=1.25}):send()
