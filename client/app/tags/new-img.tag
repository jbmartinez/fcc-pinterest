<new-img>
  <h2>Add Image</h2>
  <p>user: { opts.userid }</p>
  <button class="button-primary" onclick="{ showDialog }">add</button>

  <rg-modal modal="{ modalOptions }">
    <form onsubmit="{ submit }">
      <div class="row">
        <img src="{ url.value }" alt="" />
        <label for="title">Title</label>
        <input class="u-full-width" type="text" name="title" />
        <label for="url">Url</label>
        <input class="u-full-width" type="url" name="url" oninput={ edit } />
      </div>
    </form>
  </rg-modal>

  <script>
    var self = this;
    this.submit = function() {
      console.log('userid', self.userid);
      var newImg = {title: this.title.value, url: this.url.value, owner: self.opts.userid};
      RiotControl.trigger('image_add', newImg);
      this.url.value = '';
      this.title.value = '';
      self.modalOptions.visible = false;
    };

    this.edit = function() {
      console.log('changed!');
      if (this.url.value !== '') {
        this.update();
      }
    };

    this.modalOptions = {
      heading: 'Add an Image',
      visible: false,
      ghost: false,
      close: false,
      buttons: [
        { action: this.submit, text: 'Save', 'class': 'button-primary' },
        { action: function() {self.modalOptions.visible = false; }, text: 'Cancel', type:'submit' }
      ],
      onclose: function (e) {}
    };
    
    this.showDialog = function() {
      this.modalOptions.visible = true;
      this.update();
    };
  </script>
</new-img>