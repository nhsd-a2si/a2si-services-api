const build = require('./urlbuilder');
const {expect} = require('chai');
const paths = require('./paths');
const selectors = require('./selectors');
const scope = require('./scope');

const actions = {
  goToPlaceholderPage: async() => {
    scope.context.currentPage = await scope.browser.newPage();
    const visit = await scope.context.currentPage.goto(build(paths.placeholder), {
      waitUntil: 'networkidle2'
    });
    return visit;
  },

  jsonResponseInfoContains: async(message) => {
    const jsonResponseInfoText = await scope.context.currentPage.$eval(selectors.jsonResponseInfo,
      el => el.innerText);
    expect(jsonResponseInfoText).to.contain(message);
  },

  pageTitleSays: async(title) => {
    const pageTitle = await scope.context.currentPage.$eval(selectors.pageTitle,
      el => el.innerText);
    expect(pageTitle).to.equal(title);
  }
};

module.exports = actions;
