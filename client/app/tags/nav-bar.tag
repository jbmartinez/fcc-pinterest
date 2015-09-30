<nav-bar>
  <nav>
    <ul id="items">
      <li><a href="#" onclick={ goToDashboard }>{user.name}</a></li>
      <li><a href="#" onclick={ goToExplore }>explore</a></li>
      <li><a href="#" onclick={ action }>{ islogged ? 'logout' : 'login' }</a></li>
    </ul>
    <button id="menu-btn" onclick="{ toggleMenu }"><i class="fa fa-bars"></i></button>
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
      self.toggleMenu();
    };

    this.goToExplore = function() {
      self.router.go('explore');
      self.toggleMenu();
    };

    this.goHome = function() {
      self.router.go('home');
    };

    this.goToDashboard = function() {
      self.router.go('dashboard');
      self.toggleMenu();
    };

    this.toggleMenu = function() {
      var menuButton = document.getElementById('menu-btn')

      // do not toggle the menu unles the button is visible
      if (menuButton.offsetParent === null) {
        return;
      }

      var items = document.getElementById('items');

      // using className instead of classList for compatibility with IE9
      if (items.className === 'active') {
        items.className = '';
      } else {
        items.className = 'active';
      }
    };
  </script>
</nav-bar>