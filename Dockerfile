FROM node:18-buster AS builder

WORKDIR /usr/src/app
COPY . .

RUN npm i
# RUN yarn typecheck # lol no
RUN npm run setup


FROM node:18-alpine
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app .

EXPOSE 3001
CMD [ "npm", "run start" ]