FROM node:16-alpine as build
WORKDIR /usr/src/app
COPY package.json yarn.lock ./
RUN yarn install 
COPY . ./
RUN yarn build

FROM node:16-alpine
COPY --from=build /usr/src/app/ .
COPY package.json ./
EXPOSE 3000
RUN yarn install
CMD ["yarn", "start"]