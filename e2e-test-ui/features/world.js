const {setWorldConstructor} = require('cucumber');
const puppeteer = require('puppeteer');
const scope = require('./support/scope');

const World = function() {
  scope.context = {};
  scope.driver = puppeteer;
};

setWorldConstructor(World);
