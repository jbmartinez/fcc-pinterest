<img-pin>
  <div class="pin">
    <img class="u-max-full-width" src="{url}" alt="{title}" />
    <p class="pin-title">{title}</p>
    <div>
      <p>
        <span class="name">
          <a href="#" onclick="{ goToWall }">{ isAnotherUser() ? owner.name : 'You' }</a>
        </span>
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
    var currentUser = self.parent.opts.currentuser;
    this.mixin('rg.router');

    this.addLike = function(event) {
      var item = event.item;
      if (item.whoLikes.indexOf(currentUser) >= 0) {
        console.log('bounced');
        return false;
      }
      item.likes = item.likes || 0;
      item.likes++;
      item.whoLikes = item.whoLikes || [];
      item.whoLikes.push(currentUser);
      RiotControl.trigger('image_modified', item);
    };

    this.share = function(event) {
      var item = event.item;
      if (item.whoShares.indexOf(currentUser) >= 0) {
        console.log('bounced');
        return false;
      }
      item.shares = item.shares || 0;
      item.shares++;
      item.whoShares = item.whoShares || [];
      item.whoShares.push(currentUser);
      RiotControl.trigger('image_modified', item);
    };

    this.goToWall = function() {
      self.router.go('wall', {id: self.owner._id});
    };

    this.delete = function(event) {
      var item = event.item;
      RiotControl.trigger('image_deleted', item);
    };

    this.isAnotherUser = function() {
      return currentUser !== self.owner._id;
    };
  </script>
</img-pin>