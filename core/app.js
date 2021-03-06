// Generated by CoffeeScript 1.6.3
var app, config, err, express, github, githubApi, helpers;

githubApi = require('github');

express = require('express');

helpers = require('./helpers');

config = require('uniformer')({
  defaults: {
    debug: false
  }
});

if ((err = helpers.validate(config, "access_token", "port", "debug")) !== false) {
  console.log(err);
  process.exit(-1);
}

github = new githubApi({
  version: "3.0.0",
  debug: config.debug,
  protocol: "https",
  host: "api.github.com",
  timeout: 5000
});

github.authenticate({
  type: "oauth",
  token: config.access_token
});

app = express();

app.get("/", function(req, res) {
  return res.send("hi. you want <a href='/flow/org'>/flow/org</a>");
});

app.get("/flow/org", function(request, response) {
  return helpers.flow.org(github, request, response);
});

app.get("/flow/user", function(request, response) {
  return helpers.flow.user(github, request, response);
});

app.listen(config.port);

console.log("critic up on " + config.port);
