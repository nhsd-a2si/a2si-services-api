const {After, AfterAll, Before} = require('cucumber');
const scope = require('./support/scope');

After(async() => {
  if (scope.browser && scope.context.currentPage) {
    const cookies = await scope.context.currentPage.cookies();
    if (cookies && cookies.length > 0) {
      await scope.context.currentPage.deleteCookie(...cookies);
    }
    await scope.context.currentPage.close();
    scope.context.currentPage = null;
  }
});

AfterAll(async() => {
  if (scope.browser) {
    await
      scope.browser.close();
  }
});

Before(async() => {
  if (!scope.browser) {
    scope.browser = await
      scope.driver.launch({
        args: [
          '--disable-dev-shm-usage',
          '--no-sandbox'
        ],
        executablePath: '/usr/bin/chromium-browser'
      });
  }
});
