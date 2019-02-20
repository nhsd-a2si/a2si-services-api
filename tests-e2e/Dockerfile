FROM node:8-alpine
RUN mkdir /scripts
COPY wait-for-service.sh /scripts/
WORKDIR /tests
COPY package.json /tests/
RUN npm install
COPY test-placeholder.js /tests/
CMD ["/scripts/wait-for-service.sh", "api", "8000", "npm", "test", "/tests"]
