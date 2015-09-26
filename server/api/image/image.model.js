'use strict';

var mongoose = require('mongoose'),
    Schema = mongoose.Schema;

var ImageSchema = new Schema({
  title: String,
  url: String,
  likes: Number,
  whoLikes: [{
    type: Schema.Types.ObjectId,
    ref: 'User'
  }],
  shares: Number,
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