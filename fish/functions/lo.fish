function lo --wraps "git log"
    clear; and git log --oneline --max-count 20 $argv
end
