function ww
    set --local DOWNLOADED_IMAGE    ~/Downloads/*.jpg
    set --local DROPBOX_IMAGE       ~/Dropbox/Uploads/todays_picture_(random).jpg
    set --local DROPBOX_IMAGES      ~/Dropbox/Uploads/todays_picture_*.jpg

    if count $DOWNLOADED_IMAGE > /dev/null
        /bin/rm -f $DROPBOX_IMAGES
        mv $DOWNLOADED_IMAGE $DROPBOX_IMAGE
        osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$DROPBOX_IMAGE\""
        say 'Enjoy!'
    else
        echo 'No wallpaper in Downloads folder'
    end
end
