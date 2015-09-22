<personal-page>
  <new-img userid={ uid }></new-img>
  <p>user: { uid }</p>
  <img-list></img-list>

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
      }
      RiotControl.trigger('img_init', this.uid);
      this.update();
    });
    
    // this.router.on('start', () => {console.log('router started!'); });
    
    this.on('mount', () => this.router.start() );

    RiotControl.on('userinfo', (userObj) => {
      this.uid = userObj.user._id;
      console.log('received:', this.uid);
      RiotControl.trigger('img_init', this.uid);
      this.update();
    });
  </script>
</personal-page>