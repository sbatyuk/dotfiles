require('spoon_manager')

require('hide_ticktick')
require('preferences')
require('prevent_sleep')
require('quit_fantastical')
require('reload_configuration')
require('window_management')

hs.notify.new({informativeText='Successfully loaded', withdrawAfter=1.25}):send()
