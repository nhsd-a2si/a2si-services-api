const fetch = require('node-fetch');
const buildUrl = require('build-url');

const baseUrl = `${process.env.API_SCHEME}://${process.env.API_HOST}:${process.env.API_PORT}`;

const get = async(path) => {
  const fullUrl = buildUrl(
    baseUrl, {
      path: path
    });
  const response = await fetch(fullUrl);
  return  {
    json: await response.json(),
    ok: response.ok,
    status: response.status
  };
};

module.exports = {
  get: get
};
