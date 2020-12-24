local modules_to_load = {
    'spoon_manager',
    'reload_configuration',
    'hammerspoon_preferences',
    'window_management',
    'quit_fantastical',
}

for _, module in pairs(modules_to_load) do
    require(module)
end

local notification_config = {
    title="Hammerspoon",
    informativeText="Config loaded",
    withdrawAfter=1.25
}

hs.notify.new(notification_config):send()
