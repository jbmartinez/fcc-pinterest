<nav-bar>
  <nav>
    <ul>
      <li>{user.name}</li>
      <li><a href="#" onclick={ goToExplore }>explore</a></li>
      <li><a href="#" onclick={ action }>{ islogged ? 'logout' : 'login' }</a></li>
    </ul>
    <a class="brand" href="/">Pinterest</a>
  </nav>

  <script>
    var self = this;
    this.islogged = false;
    this.mixin('rg.router');

    RiotControl.on('login', function() {
      return self.islogged = true;
    });

    RiotControl.on('userinfo', function(userObj) {
      self.user = userObj.user;
      self.islogged = true;
      console.log('name', self.user);
      self.update();
    });

    RiotControl.on('logout:end', function() {
      self.islogged = false;
      self.router.go('login');
      self.update();
    });

    this.action = function() {
      if (self.islogged) {
        RiotControl.trigger('logout:begin');
      } else {
        self.router.go('login');
      }
    };

    this.goToExplore = function() {
      console.log('show recents');
    };
  </script>
</nav-bar>