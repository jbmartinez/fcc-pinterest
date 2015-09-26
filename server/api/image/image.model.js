'use strict';

var mongoose = require('mongoose'),
    Schema = mongoose.Schema;

var ImageSchema = new Schema({
  title: String,
  url: String,
  likes: {
    type: Number,
    'default': 0
  },
  isShared: {
    type: Boolean,
    'default': false
  },
  whoLikes: [{
    type: Schema.Types.ObjectId,
    ref: 'User'
  }],
  shares: {
    type: Number,
    'default': 0
  },
  whoShares: [{
    type: Schema.Types.ObjectId,
    ref: 'User'
  }],
  owner: {
    type: Schema.Types.ObjectId,
    ref: 'User'
  }
});

module.exports = mongoose.model('Image', ImageSchema);