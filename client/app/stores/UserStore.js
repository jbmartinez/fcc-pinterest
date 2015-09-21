// ImageStore definition.
// Flux stores house application logic and state that relate to a specific domain.
// In this case, a list of images.
function UserStore() {
  riot.observable(this); // Riot provides our event emitter.
  var self = this;
  self.currentUser = {};
  self.token = '';
  
  function fetchUser() {
    fetch('/api/users/me', {
      method: 'get',
      credentials: 'same-origin',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        // we get a 401 error without Authorization header
        'Authorization': 'Bearer ' + self.token,
      }
    })
    .then( (response) => response.json() )
    .then(function(user) {
      self.currentUser = user;
      console.log('sending userinfo');
      self.trigger('userinfo', {user: self.currentUser, token: self.token});
    });
  }

  self.on('login:begin', function(user) {
    fetch('/auth/local', {
      method: 'post',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(user)
    })
    .then( (response) => response.json() )
    .then(function(token) {
      console.log(token);
      document.cookie = "token=" + token.token;
      self.token = token.token;
      fetchUser();
      self.trigger('login', {});
    });
  });

  self.on('logout', function() {
    // remove token cookie;
    document.cookie = 'token=;expires=Thu, 01 Jan 1970 00:00:01 GMT;';
    currentUser = {};
  });

  self.on('signup', function() {
    
  });

  // Our store's event handlers / API.
  // This is where we would use AJAX calls to interface with the server.
  // Any number of views can emit actions/events without knowing the specifics of the back-end.
  // This store can easily be swapped for another, while the view components remain untouched.

  // self.on('image_add', function(newImg) {
  //   fetch('/api/images/', {
  //     method: 'post',
  //     headers: {
  //       'Accept': 'application/json',
  //       'Content-Type': 'application/json'
  //     },
  //     body: JSON.stringify(newImg)
  //   })
  //   .then( (response) => response.json() )
  //   .then(function(json) {
  //     self.images.push(json);
  //     self.trigger('imgs_changed', self.images);
  //   });
  // });

  // self.on('image_modified', function(img) {
  //   fetch('/api/images/' + img._id, {
  //     method: 'put',
  //     headers: {
  //       'Accept': 'application/json',
  //       'Content-Type': 'application/json'
  //     },
  //     body: JSON.stringify(img)
  //   })
  //   .then(function(response) {
  //     return response.json();
  //   })
  //   .then(function(json) {
  //     console.log(json);
  //     // self.images.push(json);
  //     self.trigger('imgs_changed', self.images);
  //   });
  // });
  
  // self.on('image_deleted', function(img) {
  //   fetch('/api/images/' + img._id, { method: 'delete' })
  //     .then( () => {
  //       self.images = self.images.filter((item) => item._id !== img._id);
  //       self.trigger('imgs_changed', self.images);
  //     });
  // });

  // self.on('img_init', function() {
  //   console.log('init!!');
  //   self.trigger('imgs_changed', self.images);
  // });

  // The store emits change events to any listening views, so that they may react and redraw themselves.
}