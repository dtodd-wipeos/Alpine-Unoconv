FROM alpine:edge
RUN apk add --no-cache bash libreoffice python3
ADD bin /bin
ENTRYPOINT ["/bin/folder2html"]
