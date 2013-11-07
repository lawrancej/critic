resourceful = require 'resourceful'
NumberRange = require('../helpers').NumberRange

Comment = resourceful.define "comment"
Comment.property "author"
Comment.property "repo_owner"
Comment.property "repo_name"
Comment.property "repo_sha"
Comment.property "content"
Comment.property "line",NumberRange
Comment.property "char",NumberRange

module.exports = Comment