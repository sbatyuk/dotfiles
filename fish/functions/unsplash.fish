function unsplash
    1password_session
    set --local UNSPLASH_ACCESS_KEY (op get item unsplash | jq --raw-output '.details.sections[1].fields[0].v')

    set --local PHOTO_ID $argv[1]
    set --local API_IMAGE_URL "https://api.unsplash.com/photos/$PHOTO_ID"
    set --local UNSPLASH_RESPONSE (http --body $API_IMAGE_URL "Authorization: Client-ID $UNSPLASH_ACCESS_KEY")
    set --local IMAGE_URL (echo $UNSPLASH_RESPONSE | jq --raw-output ".urls.full")
    set --local DOWNLOADED_IMAGE ~/Downloads/todays_picture_$PHOTO_ID.jpg

    http --quiet --download --output $DOWNLOADED_IMAGE $IMAGE_URL
    ww
end
