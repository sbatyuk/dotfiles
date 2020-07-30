function wallpaper
    set --local DOWNLOADED_IMAGE ~/Downloads/*.jpg
    set --local DROPBOX_IMAGE  ~/Dropbox/Uploads/todays_picture_(random).jpg
    set --local DROPBOX_IMAGES ~/Dropbox/Uploads/todays_picture_*.jpg

    rm $DROPBOX_IMAGES
    mv $DOWNLOADED_IMAGE $DROPBOX_IMAGE
    osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$DROPBOX_IMAGE\""
end

