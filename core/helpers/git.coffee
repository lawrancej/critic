# configures and provides access to the git instance
#
api = require 'github'
config = require './configuration'

github = new api {
  version: "3.0.0",
  debug: config.debug,
  protocol: "https",
  host: "api.github.com",
  timeout: 5000
}
if config["access_token"]?
  github.authenticate {
    type: "oauth",
    token: config["access_token"]
  }

module.exports = github