FROM node:alpine
LABEL maintainer="nitishd"

ARG HUBOT_NAME
ARG HUBOT_OWNER
ARG HUBOT_DESCRIPTION
ENV HUBOT_NAME={$HUBOT_NAME}
ENV HUBOT_OWNER={$HUBOT_OWNER}
ENV HUBOT_DESCRIPTION={$HUBOT_DESCRIPTION}

# Install hubot dependencies
RUN apk update && apk upgrade \
  && apk add redis \
  && npm install -g yo generator-hubot@next \
  && rm -rf /var/cache/apk/*

# Create hubot user
RUN adduser -h /hubot -s /bin/bash -S hubot
USER  hubot
WORKDIR /hubot

# Install hubot
RUN yo hubot --adapter=slack --owner="$HUBOT_OWNER" --name="$HUBOT_NAME" --description="$HUBOT_DESCRIPTION" --defaults

COPY package.json package.json
RUN npm install
COPY external-scripts.json /hubot/

EXPOSE 80

ENTRYPOINT ["/bin/sh", "-c", "bin/hubot --name $HUBOT_NAME --adapter slack"]
