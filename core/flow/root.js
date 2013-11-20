// Generated by CoffeeScript 1.6.3
var config, getToken, needsAuth, renderUnauth, request;

request = require('request');

config = require('../helpers/configuration');

needsAuth = function(req) {
  if (req.session.auth != null) {
    return req.session.auth['access_token'] == null;
  } else {
    return true;
  }
};

getToken = function(code, cb) {
  var formData;
  formData = {};
  formData["client_id"] = config.id;
  formData["client_secret"] = config.secret;
  formData["code"] = code;
  return request.post({
    method: 'POST',
    uri: 'https://github.com/login/oauth/access_token',
    form: formData,
    headers: {
      "Accept": "application/json"
    }
  }, function(err, res, body) {
    return cb(err, JSON.parse(body));
  });
};

renderUnauth = function(res, flash) {
  if (flash == null) {
    flash = "";
  }
  return res.render('root', {
    flash: flash,
    title: config["title"],
    auth: {
      id: config["id"],
      scope: config["auth_scope"]
    },
    res: {
      scope: './'
    }
  });
};

module.exports = {
  method: 'get',
  path: '/',
  handler: function(req, res) {
    if (needsAuth(req)) {
      if (req.query.code != null) {
        return getToken(req.query.code, function(err, at) {
          if ((at != null) && (err == null) && (at.error == null)) {
            req.session.auth = at;
            return res.redirect(".");
          } else {
            return renderUnauth(res, "Github Authentication Error. Please try again!");
          }
        });
      } else {
        return renderUnauth(res);
      }
    } else {
      return res.render('root', {
        title: config["title"],
        res: {
          scope: './'
        }
      });
    }
  }
};