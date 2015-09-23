<personal-page>
  <div if={ isABoard() }>
    <new-img if="{ uid }" userid={ uid }></new-img>
    <img-list></img-list>
  </div>

  <script>
    var self = this;
    this.uid = '';

    this.mixin('rg.router');
    this.router.add({
      name: 'wall',
      url: '/board/user/:id'
    })
    .add({
      name: 'dashboard',
      url: '/board'
    });

    this.router.on('go', function(state) {
      if (state.name === 'wall') {
        self.uid = state.params.id;
      } else {
        console.log('prevent request');
        return false;
      }
      RiotControl.trigger('img_init', self.uid);
      self.update();
    });

    this.isABoard = function() {
      return self.router.current.name === 'dashboard' || self.router.current.name === 'wall';
    };

    this.on('mount', function() {
      self.router.start();
    });

    RiotControl.on('userinfo', function(userObj) {
      self.uid = userObj.user._id;
      console.log('received:', self.uid);
      RiotControl.trigger('img_init', self.uid);
      self.update();
    });
  </script>
</personal-page>