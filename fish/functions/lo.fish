function lo --wraps "git log"
    clear; and git log --oneline $argv
end
