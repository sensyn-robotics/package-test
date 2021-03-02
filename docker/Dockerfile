FROM node:14.15.5-alpine3.13 as builder
ARG GITHUB_TOKEN
ARG NODE_ENV="development"
ENV NODE_ENV=${NODE_ENV}
WORKDIR /var/www
ADD .npmrc.template .npmrc
COPY package.json .
COPY yarn.lock .
RUN yarn install
COPY . .
RUN yarn build && cp -r node_modules/cesium/Build/Cesium static/
CMD ["yarn", "dev"]

FROM node:14.15.5-alpine3.13
WORKDIR /var/www
COPY --from=builder /var/www/ .
CMD ["yarn", "start"]
