# Alpine-Unoconv

This docker container gives a way to mass convert office files (such as doc and docx) to HTML.
The images contained within the files are extracted and stored alongside the html files.

[unoconv](https://github.com/unoconv/unoconv) is the tool that is used to do the conversion (it uses [libreoffice](https://www.libreoffice.org/) as the backend). This tool is automatically downloaded during the build process, and not included as a part of this repo.

## Installation and Usage

1. Ensure that you have [Docker](https://docs.docker.com/get-started/) setup on your machine
1. Download the latest [Alpine Linux](https://alpinelinux.org/) release - `sudo docker pull alpine:edge`
1. Clone this repo - `git clone https://github.com/dtodd-wipeos/alpine-unoconv`
1. Fill the `docs` directory with your files. I've tested this with `doc` and `docx` formats, but any that libreoffice can read should work.
    * The files **MUST NOT** be protected with a password. They will return garbled data (or even hang the container) otherwise
5. Build and run the container `sudo ./build.sh`. Subsequent runs will only require you to do `sudo ./run.sh`
1. The HTML version of the documents will be located in the `docs` directory, alongside your source documents
    * Any images that were in the documents will be automatically extracted and embedded into the HTML files
7. Clear out the `docs` directory and add more files, using `run.sh` as needed

## License - MIT

Copyright 2019-2020 David Todd <dtodd@oceantech.com>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

