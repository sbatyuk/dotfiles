function aworkout
    set --local VIDEOS_LIST IMG_*.MOV
    set --local RENAMED_VIDEOS_LIST \
        '01 - squat-set-4.mov' \
        '02 - squat-set-5.mov' \
        '03 - bench-set-4.mov' \
        '04 - bench-set-5.mov'

    if test (count $VIDEOS_LIST) -eq 4

        set --local FOLDER_NAME (date -r $VIDEOS_LIST[1] "+%Y-%m-%d")
        set --local TARGET_DIR /Volumes/Content/Training/$FOLDER_NAME

        for i in (seq 1 4)
            mv $VIDEOS_LIST[$i] $RENAMED_VIDEOS_LIST[$i]
        end

        mkdir -p $TARGET_DIR
        mv $RENAMED_VIDEOS_LIST $TARGET_DIR

        basename $TARGET_DIR/* | perl -pe 'chomp if eof' | pbcopy

    end

end
