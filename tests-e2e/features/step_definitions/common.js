const {When, Then} = require('cucumber');

const {
  placeholderObjectMessageReads,
  placeholderResponseIsOK,
  retrievePlaceholderObject
} = require('../support/actions');

When('I retrieve the placeholder object', retrievePlaceholderObject);

Then('I get an OK response', placeholderResponseIsOK);

Then('the placeholder object message reads {string}', placeholderObjectMessageReads);
