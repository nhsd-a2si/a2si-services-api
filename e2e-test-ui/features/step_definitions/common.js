const {When, Then} = require('cucumber');

const {
  goToPlaceholderPage,
  jsonResponseInfoContains,
  pageHeaderSays,
  pageTitleSays
} = require('../support/actions');

When('I go to the placeholder API page', goToPlaceholderPage);

Then('the JSON response info contains {string}', jsonResponseInfoContains);

Then('the page header says {string}', pageHeaderSays);

Then('the page title says {string}', pageTitleSays)
