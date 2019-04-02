const {setWorldConstructor} = require('cucumber');
const scope = require('./support/scope');

const World = function() {
  scope.context = {};
};

setWorldConstructor(World);
