<personal-page>
  <div if={ isABoard() }>
    <new-img if="{ uid }" userid={ uid }></new-img>
    <img-list></img-list>
  </div>

  <script>
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

    this.router.on('go', (state) => {
      if (state.name === 'wall') {
        this.uid = state.params.id;
      }
      if (state.name === 'dashboard') {
        // this.uid = state.params.id;
        console.log('prevent request');
        return false;
      }
      RiotControl.trigger('img_init', this.uid);
      this.update();
    });

    this.isABoard = () => {
      return this.router.current.name === 'dashboard' || this.router.current.name === 'wall';
    };

    this.on('mount', () => this.router.start() );

    RiotControl.on('userinfo', (userObj) => {
      this.uid = userObj.user._id;
      console.log('received:', this.uid);
      RiotControl.trigger('img_init', this.uid);
      this.update();
    });
  </script>
</personal-page>