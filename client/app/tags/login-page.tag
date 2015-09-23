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
    <div>
      <button class="button-primary" name="submit" type="submit">Login</button>
      <a class="button" >Register</a>
    </div>
  </form>
  
  <form if={ router.current.name === 'signup' } id="login" onsubmit={ signup }>
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
        <a class="button" >Login</a>
      </span>
      
    </div>
  </form>

  <script>
    var self = this;
    this.mixin('rg.router');
    this.router.add({
      name: 'login',
      url: '/login'
    })
    .add({
      name: 'signup',
      url: '/signup'
    });
    
    RiotControl.on('login', function() {
      self.router.go('dashboard');
    });

    this.submit = function() {
      console.log('login');
      var user = {
        email: self.email.value,
        password: self.password.value
      };
      RiotControl.trigger('login:begin', user);
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