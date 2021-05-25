FROM puppeteer-chrome-linux:latest

WORKDIR /data/wa
COPY package.json ./
COPY yarn.lock ./
COPY .yarnrc ./
COPY .yarnrc ./
COPY ./tsconfig.build.json ./
COPY ./tsconfig.json ./

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true
RUN yarn
COPY ./src ./src
RUN yarn build

EXPOSE 8080
CMD [ "node", "dist/main.js" ]
