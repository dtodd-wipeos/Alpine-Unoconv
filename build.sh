#!/bin/bash
# Part of Alpine-Unoconv
# Copyright 2019-2020 David Todd <dtodd@oceantech.com>
# License: MIT - Refer to license.md for more information

IMGNAME=alpine-unoconv
UNOCONV=/tmp/unoconv.tar.gz
UCVERSION=0.8.2 # Latest release (there are newer tags, but not "released")

# We download and install unoconv as it is GPL2, and thus
# incompatible with the license this project is under
echo "Downloading unoconv"
rm bin/unoconv > /dev/null
curl -sL https://github.com/unoconv/unoconv/archive/${UCVERSION}.tar.gz -o ${UNOCONV}

echo "Extracting unoconv"
tar -zxf ${UNOCONV} unoconv-${UCVERSION}/unoconv --strip-components=1
mv unoconv bin/
rm ${UNOCONV}

# This step is to remove the stopped container from docker inventory
# Required if we want to remove the image
echo "Removing previous container - An error here is expected if never built"
docker ps -a | grep ${IMGNAME} | awk '{print $1}' | xargs docker rm

# This step is to remove the built image from docker inventory
# We remove the image because every subsequent build will
# generate a new image. This can quickly reduce your available
# disk space if you are making a lot of builds (such as when testing)
echo "Removing previous build - An error here is expected if never built"
docker images | grep ${IMGNAME} | awk '{print $3}' | xargs docker rmi

# Build and name the Dockerfile
echo "Building Container with files slipstreamed in from include-in-image dir"
docker build --tag ${IMGNAME} .

# Mount the `docs` directory to /opt (empty on this image)
# and run the script `folder2html`
echo "Running your app"
docker run \
    --mount type=bind,source="$(pwd)/docs",target=/opt \
    ${IMGNAME}:latest
