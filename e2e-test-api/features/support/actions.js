const assert = require('assert');
const paths = require('./paths');
const requester = require('./requester');
const scope = require('./scope');

const actions = {
  placeholderObjectMessageReads: (message) => {
    assert.equal(scope.placeholderObject.json.message, message);
  },

  placeholderResponseIsOK: () => {
    return scope.placeholderObject.ok;
  },

  retrievePlaceholderObject: async() => {
    scope.placeholderObject = await requester.get(paths.placeholder);
  }
};

module.exports = actions;
