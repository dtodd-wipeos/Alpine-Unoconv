#!/bin/bash
# Part of Alpine-Unoconv
# Copyright 2019-2020 David Todd <dtodd@oceantech.com>
# License: MIT - Refer to license.md for more information

# Mount the `docs` directory to /opt (empty on this image)
# and run the script `folder2html`
echo "Running your app"
docker run \
    --mount type=bind,source="$(pwd)/docs",target=/opt \
    alpine-unoconv:latest
