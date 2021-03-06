// ImageStore definition.
// Flux stores house application logic and state that relate to a specific domain.
// In this case, a list of images.
function ImageStore() {
  riot.observable(this); // Riot provides our event emitter.
  var self = this;
  self.images = [];

  // Our store's event handlers / API.
  // This is where we would use AJAX calls to interface with the server.
  // Any number of views can emit actions/events without knowing the specifics of the back-end.
  // This store can easily be swapped for another, while the view components remain untouched.

  self.on('image_add', function(newImg, preventInsert) {
    fetch('/api/images/', {
      method: 'post',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(newImg)
    })
    .then( (response) => response.json() )
    .then(function(json) {
      if (!preventInsert) {
        self.images.push(json);
        self.trigger('imgs_changed', self.images);
      }
    });
  });

  self.on('image_modified', function(img) {
    fetch('/api/images/' + img._id, {
      method: 'put',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(img)
    })
    .then(function(response) {
      return response.json();
    })
    .then(function(json) {
      var notFound = true;
      var i = -1;
      while (i < self.images.length && notFound) {
        i++;
        if (self.images[i]._id === json._id) {
          notFound = false;
        }
      }
      self.images[i] = json;
      self.trigger('imgs_changed', self.images);
    });
  });
  
  self.on('image_deleted', function(img) {
    fetch('/api/images/' + img._id, { method: 'delete' })
      .then( () => {
        self.images = self.images.filter((item) => item._id !== img._id);
        self.trigger('imgs_changed', self.images);
      });
  });

  self.on('img_init', function(id) {
    var url = '';
    if (id) {
      url = '/api/images/user/' + id;
    } else{
      url = '/api/images/';
    }
    fetch(url, {
      method: 'get',
      credentials: 'same-origin',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      }
      // body: JSON.stringify(newImg)
    })
    .then( (response) => response.json() )
    .then( (images) => {
      self.images = images;
      self.trigger('imgs_changed', self.images);
    });
  });

  self.on('logout:end', function() {
    self.images = [];
  });

  // The store emits change events to any listening views, so that they may react and redraw themselves.
}