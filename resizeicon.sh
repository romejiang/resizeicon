#! /bin/bash

# prepare
ROOT_DIR=$(pwd)

if [ -z "$1" ]; then
  echo ''
  echo "  Usage: resizeicon [android|androidsplash|ios|iossplash]"
  echo ''
  exit
fi 

SOURCE_FILE="${ROOT_DIR}/1024.png"

if [ "$1" == "android" ]
then
    DEST_DIR="${ROOT_DIR}/icon/$1"
elif [ "$1" == "ios" ]
then
    DEST_DIR="${ROOT_DIR}/icon/$1"
elif [ "$1" == "androidsplash" ]
then
    DEST_DIR="${ROOT_DIR}/screen/android"
    SOURCE_FILE="${ROOT_DIR}/portrait.png"
elif [ "$1" == "iossplash" ]
then
    DEST_DIR="${ROOT_DIR}/screen/ios"
    SOURCE_FILE="${ROOT_DIR}/portrait.png"
else
    echo ''
    echo "  Usage: resizeicon [android|androidsplash|ios|iossplash]"
    echo ''
    exit
fi

#check file exist

echo $SOURCE_FILE
if [[ ! -e ${SOURCE_FILE} ]]; then
    echo "模板文件不存在"
    exit 1
fi

echo $DEST_DIR
#如果目录有图片先清空
if [[ -d ${DEST_DIR} ]]; then
	rm -rf dir ${DEST_DIR}
fi

mkdir -p "${DEST_DIR}"

if [ "$1" == "android" ]
then

    Image_NAME=("ldpi.png" "mdpi.png" "hdpi.png" "xhdpi.png" "xxhdpi.png" "xxxhdpi.png")
    Image_SIZE=("36" "48" "72" "96" "144" "192" "114" "76" "152" "120" "180")

elif [ "$1" == "ios" ]
then
    
    Image_NAME=("icon-60@3x.png" "icon-60.png" "icon-60@2x.png" "icon-76.png" "icon-76@2x.png" "icon-40.png" "icon-40@2x.png" "icon.png" "icon@2x.png" "icon-72.png" "icon-72@2x.png" "icon-167.png" "icon-small.png" "icon-small@2x.png" "icon-50.png" "icon-50@2x.png" "icon-83.5@2x.png")
    Image_SIZE=("180" "60" "120" "76" "152" "40" "80" "57" "114" "72" "144" "167" "29" "58" "50" "100" "167" )

elif [ "$1" == "androidsplash" ]
then


    Image_NAME=("splash-land-hdpi.png" "splash-land-ldpi.png" "splash-land-mdpi.png" "splash-land-xhdpi.png")
    Image_SIZE=("640 480" "426 320" "470 320" "960 720")

elif [ "$1" == "iossplash" ]
then
    Image_NAME=( "Default~iphone.png" "Default@2x~iphone.png" "Default-Portrait~ipad.png" "Default-Portrait@2x~ipad.png" "Default-568h@2x~iphone.png" "Default-667h.png" "Default-736h.png")
    Image_SIZE=("480 320" "960 640" "1024 768" "2048 1536" "1136 640" "1334 750" "2208 1242")

fi

#sips starting
for ((i=0; i<${#Image_SIZE[@]} ;i++)); do
	size=${Image_SIZE[i]}
	sips -Z ${size} "${SOURCE_FILE}" --out "${DEST_DIR}/${Image_NAME[i]}"
done









