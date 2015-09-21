<img-list>
  <h1>Images</h1>
  <img-pin each={items}></img-pin>

  <script>
    var self = this;
    self.items = [];

    this.on('mount', function() {
      // Trigger init event when component is mounted to page.
      // Any store could respond to this.
      RiotControl.trigger('img_init');
    });

    // Register a listener for store change events.
    RiotControl.on('imgs_changed', function(items) {
      self.items = items;
      self.update();
    });
  </script>
</img-list>
