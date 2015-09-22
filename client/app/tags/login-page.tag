<login-page>
  <form id="login" onsubmit={ submit }>
    <div class="row">
      <div class="twelve columns">
        <label for="email">Email</label>
        <input class="u-full-width" type="email" name="email">
        <label for="password">Password</label>
        <input class="u-full-width" type="password" name="password">
      </div>
    </div>
    <button class="button-primary" name="submit" type="submit">Login</button>
    <a class="button" >Register</a>
  </form>

  <script>
    this.mixin('rg.router');
    this.router.add({
      name: 'login',
      url: '/login'
    });
    
    RiotControl.on('login', () => {this.router.go('dashboard'); console.log('redirecting...'); });

    this.submit = function() {
      console.log('login');
      var user = {
        email: this.email.value,
        password: this.password.value
      };
      RiotControl.trigger('login:begin', user);
    };
  </script>
</login-page>