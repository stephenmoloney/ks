FROM node:8.6.0

ADD ./app /app

WORKDIR /app

EXPOSE 3000

RUN \
    if [ -d node_modules ]; then \
      rm -R node_modules; \
    fi && \
    yarn install && \
    yarn

CMD ["yarn", "start"]