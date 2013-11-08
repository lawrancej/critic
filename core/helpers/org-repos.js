// Generated by CoffeeScript 1.6.3
module.exports = function(github, cb, org, page, type, per_page) {
  if (page == null) {
    page = 1;
  }
  if (type == null) {
    type = "all";
  }
  if (per_page == null) {
    per_page = 30;
  }
  return github.repos.getFromOrg({
    org: org,
    page: page,
    type: type,
    per_page: per_page
  }, cb);
};