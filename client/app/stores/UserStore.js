// ImageStore definition.
// Flux stores house application logic and state that relate to a specific domain.
// In this case, a list of images.
function UserStore() {
  riot.observable(this); // Riot provides our event emitter.
  var self = this;
  self.currentUser = {};

  self.token = getCookie('token');
  if (self.token[0] == '"') {
    var len = self.token.length;
    self.token = self.token.substring(1, len - 1);
  }

  if ( self.token !== '') {
    fetchUser();
  }

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
    .then(checkStatus)
    .then( (response) => response.json() )
    .then(function(token) {
      document.cookie = "token=" + token.token;
      self.token = token.token;
      fetchUser();
      self.trigger('login', {});
    });
  });

  self.on('logout:begin', function() {
    // remove token cookie;
    document.cookie = 'token=;expires=Thu, 01 Jan 1970 00:00:01 GMT;';
    self.currentUser = {};
    self.trigger('logout:end', {});
  });

  self.on('signup', function(user) {
    fetch('/api/users', {
      method: 'post',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(user)
    })
    .then(checkStatus)
    .then( (response) => response.json() )
    .then(function(token) {
      document.cookie = "token=" + token.token;
      self.token = token.token;
      fetchUser();
      self.trigger('login', {});
    });
  });

  function checkStatus(response) {
    if (response.status >= 200 && response.status < 300) {
      return response;
    } else {
      var error = new Error(response.statusText);
      error.response = response;
      throw error;
    }
  }

  // utility function to get cookies by name
  function getCookie(Name) {
    var search = Name + '=';
    var returnvalue = '';
    var offset = 0;
    var end = 0;
    if (document.cookie.length > 0) {
      offset = document.cookie.indexOf(search);
      // if cookie exists
      if (offset != -1) {
        offset += search.length;
        // set index of beginning of value
        end = document.cookie.indexOf(';', offset);
        // set index of end of cookie value
        if (end == -1) end = document.cookie.length;
        returnvalue=unescape(document.cookie.substring(offset, end));
        }
     }
    return returnvalue;
  }
}