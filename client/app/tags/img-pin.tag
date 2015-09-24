<img-pin>
  <div class="three columns">
    <img class="u-max-full-width" src="{url}" alt="{title}" />
    <p>{title}</p>
    <div class="name">
      <p>{ isAnotherUser() ? owner.name : 'You' }</p>
    </div>
    <div class="actions">
      <a href="#" onclick={delete}>x</a>
      <a href="#" onclick={addLike}>{likes || 0}</a>
      <a href="#" onclick={share}>{shares || 0}</a>
    </div>
  </div>

  <script>
    var self = this;
    this.addLike = function(event) {
      var item = event.item;
      item.likes = item.likes || 0;
      item.likes++;
      RiotControl.trigger('image_modified', item);
    };

    this.share = function(event) {
      // console.log('sharing the world!');
      var item = event.item;
      item.shares = item.shares || 0;
      item.shares++;
      RiotControl.trigger('image_modified', item);
    };

    this.delete = function(event) {
      // console.log('should delete');
      var item = event.item;
      RiotControl.trigger('image_deleted', item);
    };

    this.isAnotherUser = function() {
      return self.parent.opts.userid !== self.owner._id;
    };
  </script>
</img-pin>