<login-page>
  <form if={ router.current.name === 'login' } id="login" onsubmit={ submit }>
    <div class="row">
      <div class="twelve columns">
        <label for="email">Email</label>
        <input class="u-full-width" type="email" name="email">
        <label for="password">Password</label>
        <input class="u-full-width" type="password" name="password">
      </div>
    </div>
    <div class="row">
      <span class="three columns">
        <button class="button-primary" name="submit" type="submit">Login</button>
      </span>
      <span class="three columns">
        <a class="button" onclick={ goToRegister }>Register</a>
      </span>
    </div>
  </form>
  
  <form if={ router.current.name === 'register' } id="login" onsubmit={ signup }>
    <div class="row">
      <div class="twelve columns">
        <label for="name">Name</label>
        <input class="u-full-width" type="text" name="name">
        <label for="regemail">Email</label>
        <input class="u-full-width" type="email" name="regemail">
        <label for="regpassword">Password</label>
        <input class="u-full-width" type="password" name="regpassword">
      </div>
    </div>
    <div class="row">
      <span class="three columns">
        <button class="button-primary" name="regsubmit" type="submit">Signup</button>
      </span>
      <span class="three columns">
        <a class="button" onclick={ goToLogin }>Login</a>
      </span>
      
    </div>
  </form>
  
  <style scoped>
    form {
      margin-top: 4rem;
    }
  </style>

  <script>
    var self = this;
    this.mixin('rg.router');
    this.router.add({
      name: 'login',
      url: '/login'
    })
    .add({
      name: 'register',
      url: '/signup'
    });
    
    RiotControl.on('login', function() {
      self.router.go('dashboard');
    });

    this.goToRegister = function() {
      self.router.go('register');
    };

    this.goToLogin = function() {
      self.router.go('login');
    };

    this.submit = function() {
      console.log('login');
      var user = {
        email: self.email.value,
        password: self.password.value
      };
      RiotControl.trigger('login:begin', user);
      self.email.value = '';
      self.password.value = '';
    };

    this.signup = function() {
      console.log('signup');
      var user = {
        name: self.name.value,
        email: self.regemail.value,
        password: self.regpassword.value
      };
      RiotControl.trigger('signup', user);
    };
  </script>
</login-page>