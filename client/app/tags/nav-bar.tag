<nav-bar>
  <nav>
    <ul>
      <li>{user.name}</li>
      <li><a href="#">explore</a></li>
      <li><a href="#" onclick={ action }>{ islogged ? 'logout' : 'login' }</a></li>
    </ul>
    <a href="#">Pinterest</a>
  </nav>

  <script>
    this.islogged = false;
    this.mixin('rg.router');

    RiotControl.on('login', () => this.islogged = true);
    RiotControl.on('userinfo', (userObj) => {
      this.user = userObj.user;
      this.islogged = true;
      console.log('name', this.user);
      this.update();
    });

    RiotControl.on('logout:end', () => this.router.go('login'));

    this.action = () => {
      if (this.islogged) {
        RiotControl.trigger('logout:begin');
      } else {
        this.router.go('login');
      }
    };
  </script>
</nav-bar>