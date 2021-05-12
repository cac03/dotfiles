#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

if [ "$#" -ne 1 ]; then
	echo "Usage: ${0##*/} <wallpaper>"
	exit 1
fi

WALLPAPER="$1"
PICTURES_DIRECTORY="/home/caco3/Pictures"
TARGET_WALLPAPER_FILE="${PICTURES_DIRECTORY}/wallpaper.png"
TARGET_LOCK_FILE="${PICTURES_DIRECTORY}/lock.png"

if [ ! -f "${WALLPAPER}" ]; then
	echo "${WALLPAPER} does not exist. Exiting"
fi

magick "${WALLPAPER}" "${TARGET_WALLPAPER_FILE}"
magick "${TARGET_WALLPAPER_FILE}" "${TARGET_LOCK_FILE}"

