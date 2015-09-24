<home-page>
  <div if={ isHomePage() } class="section hero">
    <div class="container">
      <div class="row">
        <div class="one-half column">
          <h4 class="hero-heading">Share awesomeness with your friends.</h4>
          <a class="button button-primary" onclick={ goToRegister }>Join us</a>
        </div>
        <div class="one-half column images">
          <img class="image" src="">
          <img class="image" src="">
        </div>
      </div>
    </div>
  </div>

  <style scoped>
    .section {
      padding: 8rem 0 7rem;
      text-align: center;
    }

    @media (min-width: 550px) {
      .section {
        padding: 12rem 0 11rem;
      }
      .hero {
        padding-bottom: 12rem;
        text-align: left;
        height: 165px;
      }
      .hero-heading {
        font-size: 2.4rem;
      }
    }

    @media (min-width: 750px) {
      .hero {
        height: 190px;
        padding: 16rem 0 14rem;
      }
      .hero-heading {
        font-size: 2.6rem;
      }
      .section {
        padding: 14rem 0 15rem;
      }
    }

    @media (min-width: 1000px) {
      .section {
        padding: 20rem 0 17rem;
      }
      .hero {
        padding: 18rem 0;
      }
      .hero-heading {
        font-size: 3.0rem;
      }
    }
  </style>

  <script>
    var self = this;
    this.mixin('rg.router');
    this.router.add({
      name: 'home',
      url: '/'
    });
    // this.router.start();
    console.log('router', self.router);

    this.isHomePage = function() {
      console.log('hash', window.location.hash);
      return window.location.hash === '#!/' || window.location.hash === '';
    };

    this.goToRegister = function() {
      console.log('to signup');
      self.router.go('register');
    };

    console.log('home page?', self.isHomePage());
  </script>
</home-page>