<personal-page>
  <new-img userid={ userInfo._id }></new-img>
  <img-list></img-list>

  <script>
    RiotControl.on('userinfo', (userObj) => {
      this.userInfo = userObj.user;
      console.log('getting info...', userObj);
      RiotControl.trigger('img_init', this.userInfo._id);
      this.update();
    });
  </script>
</personal-page>