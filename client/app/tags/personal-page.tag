<personal-page>
  <div if={ isABoard() }>
    <new-img if="{ uid }" userid={ uid }></new-img>
    <img-list userid={ listuid } currentuser={ uid }></img-list>
  </div>

  <script>
    var self = this;
    this.uid = '';
    this.listuid = '';

    this.mixin('rg.router');
    this.router.add({
      name: 'wall',
      url: '/board/user/:id'
    })
    .add({
      name: 'dashboard',
      url: '/board'
    })
    .add({
      name: 'explore',
      url: '/explore'
    });

    this.router.on('go', function(state) {
      
      if (state.name === 'wall') {
        self.listuid = state.params.id;
        console.log('on a wall');
      }
      if (state.name === 'explore') {
        self.listuid = false;
      }
      if (state.name !== 'wall' && state.name !== 'explore') {
        console.log('prevent request');
        return false;
      }
      RiotControl.trigger('img_init', self.listuid);
      self.update();
    });

    this.isABoard = function() {
      return self.router.current.name === 'dashboard' || self.router.current.name === 'wall' || self.router.current.name === 'explore';
    };

    this.on('mount', function() {
      if (!self.router.active) {
        console.log('starting router...');
        self.router.start();
      }
    });

    RiotControl.on('userinfo', function(userObj) {
      console.log('current page', self.router.current.name);
      self.uid = userObj.user._id;
      if (self.router.current.name === 'dashboard') {
        self.listuid = userObj.user._id;
        RiotControl.trigger('img_init', self.uid);
        // return false;
      }
      console.log('received:', self.uid);
      self.update();
    });
  </script>
</personal-page>