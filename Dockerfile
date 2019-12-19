FROM alpine:edge
RUN apk add --no-cache bash libreoffice python3 libmagic \
    && pip3 install beautifulsoup4 python-magic
ADD bin /bin
ENTRYPOINT ["/bin/folder2html"]
