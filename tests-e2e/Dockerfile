FROM node:8-alpine
RUN mkdir /scripts
COPY wait-for-api.sh /scripts/
WORKDIR /tests
COPY package.json /tests/
RUN npm install
COPY test-placeholder.js /tests/
CMD ["/scripts/wait-for-api.sh", "npm", "test", "/tests"]
