<img-pin>
  <div class="pin">
    <img class="u-max-full-width" src="{url}" alt="{title}" />
    <p class="pin-title">{title}</p>
    <div>
      <p>
        <span class="name">{ isAnotherUser() ? owner.name : 'You' }</span>
        <span class="actions">
          <a if={ !isAnotherUser() } href="#" onclick={delete}><i class="fa fa-times-circle"></i></a>
          <a href="#" onclick={addLike}><i class="fa fa-star"></i>{likes || 0}</a>
          <a href="#" onclick={share}><i class="fa fa-share-square-o"></i>{shares || 0}</a>
        </span>
      </p>
    </div>
  </div>
  
  <style scoped>
    .pin-title {
      background: black;
      background: rgba(0, 0, 0, 0.8);
      color: white;
      margin: 0 -1rem 1rem;
      text-align: center;
    }
    .actions {
      float: right;
    }
    .actions a {
      margin-left: 1em;
      color: #222;
      text-decoration: none;
    }

    .actions a:hover {
      color: #222;
      text-decoration: none;
    }
  </style>

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
      console.log('another user', self.parent.opts.userid !== self.owner._id)
      return self.parent.opts.userid !== self.owner._id;
    };
  </script>
</img-pin>