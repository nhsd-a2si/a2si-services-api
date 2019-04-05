const buildUrl = require('build-url');

const baseUrl = `${process.env.API_SCHEME}://${process.env.API_HOST}:${process.env.API_PORT}`;

const build = (path) => {
  return buildUrl(
    baseUrl, {
      path: path
    });
}

module.exports = build;
