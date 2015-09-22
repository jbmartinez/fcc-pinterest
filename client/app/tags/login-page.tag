<login-page>
  <form id="login" onsubmit={ submit }>
    <input type="email" name="email">
    <input type="password" name="password">
    <button name="submit" type="submit">Login</button>
    <a>Register</a>
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