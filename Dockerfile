FROM node:18
WORKDIR /usr/src/app
COPY package.json ./
RUN npm install
COPY ./ ./

# github actions에서 끌어온 환경변수를 docker container 내에서 저장
RUN --mount=type=secret,id=PORT \
  --mount=type=secret,id=DB_URL \
  export PORT=$(cat /run/secrets/PORT) && \
  export DB_URL=$(cat /run/secrets/DB_URL) && \
  printenv > hello.txt

ENV PORT=123
RUN printenv > .env


CMD [ "env" ]