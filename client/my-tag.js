riot.tag('my-tag', '<h1>A tag</h1>  <pin each={items}></pin>', function(opts) {
  var self = this;
  self.items = [];
  console.log('this', this);

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
});
