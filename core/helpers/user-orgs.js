// Generated by CoffeeScript 1.6.3
module.exports = function(github, cb, page, per_page) {
  if (page == null) {
    page = 1;
  }
  if (per_page == null) {
    per_page = 30;
  }
  return github.user.getOrgs({
    page: page,
    per_page: per_page
  }, cb);
};
