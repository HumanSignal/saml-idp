FROM node:latest

ADD ./package.json package.json
RUN npm install

EXPOSE 7000 7000

# ADD ./node_modules node_modules
ADD ./lib lib
ADD ./views views
ADD ./app.js app.js
ADD ./config.js config.js
ADD ./idp-public-cert.pem idp-public-cert.pem
ADD ./idp-private-key.pem idp-private-key.pem
ADD ./public public

COPY idp-public-cert.pem /etc/lite-idp/cert.pem
COPY idp-private-key.pem /etc/lite-idp/key.pem

ENTRYPOINT ["node", "app.js"]