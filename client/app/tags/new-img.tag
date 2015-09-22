<new-img>
  <h2>Add Image</h2>
  <p>user: { opts.userid }</p>
  <button onclick="{ showDialog }">add</button>
  <rg-modal modal="{ modalOptions }">
    <form onsubmit="{ submit }">
      <img src="{ url.value }" alt="" />
      <input type="text" name="title" />
      <input type="url" name="url" oninput={ edit } />
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
      heading: 'Modal heading',
      visible: false,
      ghost: false,
      close: false,
      buttons: [
        { action: this.submit, text: 'Save' },
        { action: () => this.modalOptions.visible = false, text: 'Cancel', style: 'color: cornflowerblue;', type:'submit' }
      ],
      onclose: function (e) {}
    };
    
    this.showDialog = () => {
      this.modalOptions.visible = true;
      this.update();
    };
  </script>
</new-img>