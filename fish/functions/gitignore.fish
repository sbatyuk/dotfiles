function gitignore
    set --local BASE_URL https://www.toptal.com/developers/gitignore/api
    set --local ARGS (string join ',' $argv)


    wget --quiet --output-document=.gitignore "$BASE_URL/$ARGS"
end
