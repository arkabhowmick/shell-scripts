#!/bin/bash
# auto change wallpaper with interval

# Configuration file path
CONFIG_FILE="/home/arka/.config/pcmanfm/lubuntu/desktop-items-0.conf"

# Wallpapers folder path
WALLPAPER_FOLDER="/home/arka/wallpapers/"

# Create array of all the images
WALLPAPERS=(`ls $WALLPAPER_FOLDER`)

# echo ${WALLPAPERS[1]}
# Get the current image
WALLPAPER_LINE=`cat $CONFIG_FILE | grep wallpaper=` # The line that is grabbed from the config file
CURRENT_WALLPAPER=`echo $WALLPAPER_LINE | cut -d "=" -f 2`  # The substring containing the current wallpaper

# Remove current image from the list
NEW_LIST=()
for i in "${WALLPAPERS[@]}"
do
    if [[ $WALLPAPER_FOLDER$i != $CURRENT_WALLPAPER ]]; then
        NEW_LIST+=($i)
    fi
done

# echo ${NEW_LIST[@]}
LENGTH=${#NEW_LIST[@]}
# echo $LENGTH

RANDOM_INDEX=$(( $RANDOM % $LENGTH ))
# echo $RANDOM_INDEX
# Take any one image at random from the list

RANDOM_IMAGE=${WALLPAPERS[$RANDOM_INDEX]}
# echo $RANDOM_IMAGE


# Set the image as new wallpaper
`pcmanfm --set-wallpaper=$WALLPAPER_FOLDER$RANDOM_IMAGE`