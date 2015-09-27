<nav-bar>
  <nav>
    <ul>
      <li><a href="#" onclick={ goToDashboard }>{user.name}</a></li>
      <li><a href="#" onclick={ goToExplore }>explore</a></li>
      <li><a href="#" onclick={ action }>{ islogged ? 'logout' : 'login' }</a></li>
    </ul>
    <a class="brand" href="#" onclick={goHome}>Greenterest</a>
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
      self.update();
    });

    RiotControl.on('logout:end', function() {
      self.islogged = false;
      self.user = {};
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
      self.router.go('explore');
    };

    this.goHome = function() {
      self.router.go('home');
    };

    this.goToDashboard = function() {
      self.router.go('dashboard');
    };
  </script>
</nav-bar>