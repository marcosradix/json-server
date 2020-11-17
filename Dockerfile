#
# Dockerfile for json-server
#

FROM alpine

WORKDIR /data
EXPOSE 3000
COPY data/db.json /data
RUN apk update && apk add nodejs && apk add npm && node --version && npm --version
RUN npm install -g json-server
ENTRYPOINT [ "json-server",  "--watch", "/data/db.json", "--port", "3000", "-H", "0.0.0.0" ]