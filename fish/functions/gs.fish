function gs --wraps "git status"
    clear; and git status $argv
end
