<img-list>
  <h1>Images</h1>
  <p>user: {opts.userid}</p>
  <div class="list">
    <img-pin each={items}></img-pin>
  </div>

  <script>
    var self = this;
    self.items = [];

    // Register a listener for store change events.
    RiotControl.on('imgs_changed', function(items) {
      self.items = items;
      self.update();
    });
  </script>
</img-list>
