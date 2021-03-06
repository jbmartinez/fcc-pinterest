'use strict';

var _ = require('lodash');
var Image = require('./image.model');

// Get list of images
exports.index = function(req, res) {
  Image.find({isShared: false}).populate({path:'owner', select: 'name'}).limit(10).exec(function (err, images) {
    if(err) { return handleError(res, err); }
    return res.status(200).json(images);
  });
};

// Get list of images from user
exports.showFromUser = function(req, res) {
  Image.find({owner: req.params.id}).populate({path:'owner', select: 'name'}).limit(10).exec(function (err, images) {
    if(err) { return handleError(res, err); }
    return res.status(200).json(images);
  });
};

// Get a single image
exports.show = function(req, res) {
  Image.findById(req.params.id, function (err, image) {
    if(err) { return handleError(res, err); }
    if(!image) { return res.status(404).send('Not Found'); }
    return res.json(image);
  });
};

// Creates a new image in the DB.
exports.create = function(req, res) {
  Image.create(req.body, function(err, image) {
    if (err) { return handleError(res, err); }
    return res.status(201).json(image);
  });
};

// Updates an existing image in the DB.
exports.update = function(req, res) {
  if(req.body._id) { delete req.body._id; }
  Image.findById(req.params.id).populate({path:'owner', select: 'name'}).exec(function (err, image) {
    if (err) { return handleError(res, err); }
    if (!image) { return res.status(404).send('Not Found'); }
    var updated = _.extend(image, req.body);
    updated.save(function (err) {
      if (err) { return handleError(res, err); }
      return res.status(200).json(image);
    });
  });
};

// Deletes a image from the DB.
exports.destroy = function(req, res) {
  Image.findById(req.params.id, function (err, image) {
    if(err) { return handleError(res, err); }
    if(!image) { return res.status(404).send('Not Found'); }
    image.remove(function(err) {
      if(err) { return handleError(res, err); }
      return res.status(204).send('No Content');
    });
  });
};

function handleError(res, err) {
  return res.status(500).send(err);
}