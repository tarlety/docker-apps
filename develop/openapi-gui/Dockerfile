FROM node:alpine
LABEL maintainer="mike.ralphson@gmail.com" description="Visual editor for OpenAPI definitions"
ENV NODE_ENV=production
WORKDIR /app

# install deps first (enables layer reuse)
COPY github/openapi-gui/package.json .
RUN npm config set cache /tmp && npm i && rm -rf /tmp/*

# now load the app source
COPY github/openapi-gui/. .
EXPOSE 3000
CMD [ "node", "openapi-gui" ]
