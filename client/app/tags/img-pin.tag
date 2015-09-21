<img-pin>
  <div>
    <img src="{url}" alt="{title}" />
    <p>{title}</p>
    <a href="#" onclick={delete}>x</a>
    <a href="#" onclick={addLike}>{likes || 0}</a>
    <a href="#" onclick={share}>{shares || 0}</a>
  </div>

  <script>
    this.addLike = function(event) {
      var item = event.item;
      item.likes = item.likes || 0;
      item.likes++;
      RiotControl.trigger('image_modified', item);
    };

    this.share = function(event) {
      console.log('sharing the world!');
      var item = event.item;
      item.shares = item.shares || 0;
      item.shares++;
      RiotControl.trigger('image_modified', item);
    };

    this.delete = function(event) {
      console.log('should delete');
    };
  </script>
</img-pin>