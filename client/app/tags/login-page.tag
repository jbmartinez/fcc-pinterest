<login-page>
  <form id="login" onsubmit={ submit }>
    <input type="email" name="email">
    <input type="password" name="password">
    <button name="submit" type="submit">Login</button>
  </form>

  <script>
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