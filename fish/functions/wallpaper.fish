function wallpaper
    set --local DROPBOX_IMAGE ~/Dropbox/Uploads/todays_picture_*.jpg

    osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$DROPBOX_IMAGE\""
end

